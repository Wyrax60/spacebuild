--[[============================================================================
  Project spacebuild                                                           =
  Copyright Spacebuild project (http://github.com/spacebuild)                  =
                                                                               =
  Licensed under the Apache License, Version 2.0 (the "License");              =
   you may not use this file except in compliance with the License.            =
   You may obtain a copy of the License at                                     =
                                                                               =
  http://www.apache.org/licenses/LICENSE-2.0                                   =
                                                                               =
  Unless required by applicable law or agreed to in writing, software          =
  distributed under the License is distributed on an "AS IS" BASIS,            =
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.     =
  See the License for the specific language governing permissions and          =
   limitations under the License.                                              =
  ============================================================================]]

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
util.PrecacheSound("Airboat_engine_idle")
util.PrecacheSound("Airboat_engine_stop")

include('shared.lua')

local Energy_Increment = 100 --60

local SB = SPACEBUILD

function ENT:Initialize()
    self.BaseClass.Initialize(self)
    self.Active = 0
    self.damaged = 0
    self.thinkcount = 0
    if not (WireAddon == nil) then
        self.WireDebugName = self.PrintName
        self.Outputs = Wire_CreateOutputs(self, { "Out" })
    end
end

function ENT:Damage()
    if (self.damaged == 0) then self.damaged = 1 end
end

function ENT:Repair()
    self.BaseClass.Repair(self)
    self:SetColor(Color(255, 255, 255, 255))
    self.damaged = 0
end

function ENT:Destruct()
    SB.util.damage.destruct(self, true)
end

function ENT:Extract_Energy()
    local waterlevel = 0
    if CAF then
        waterlevel = self:WaterLevel2()
    else
        waterlevel = self:WaterLevel()
    end
    if (waterlevel > 0) then
        waterlevel = waterlevel / 3
    else
        waterlevel = 1 / 3
    end
    local energy = math.Round(Energy_Increment * self:GetMultiplier() * waterlevel)
    self:SupplyResource("energy", energy)
    if not (WireAddon == nil) then Wire_TriggerOutput(self, "Out", energy) end
end

function ENT:GenEnergy()
    local waterlevel = 0
    if CAF then
        waterlevel = self:WaterLevel2()
    else
        waterlevel = self:WaterLevel()
    end
    if (waterlevel > 0) then
        if (self.Active == 0) then
            self.Active = 1
            self:SetOOO(1)
            self.sequence = self:LookupSequence("HydroFans")
            if self.sequence and self.sequence ~= -1 then
                self:SetSequence(self.sequence)
                self:ResetSequence(self.sequence)
                self:SetPlaybackRate(1)
            end
        end
        if (self.damaged == 1) then
            if (math.random(1, 10) < 6) then self:Extract_Energy() end
        else
            self:Extract_Energy()
        end
    else
        if (self.Active == 1) then
            self.Active = 0
            self:SetOOO(0)
            self.sequence = self:LookupSequence("idle")
            if self.sequence and self.sequence ~= -1 then
                self:SetSequence(self.sequence)
                self:ResetSequence(self.sequence)
                self:SetPlaybackRate(1)
            end
            if not (WireAddon == nil) then Wire_TriggerOutput(self, "Out", 0) end
        end
    end
end

function ENT:Think()
    self.BaseClass.Think(self)
    if self.sequence and self.sequence ~= -1 then
        self:ResetSequence(self.sequence)
        self:SetPlaybackRate(1)
    end
    self.thinkcount = self.thinkcount + 1
    if self.thinkcount == 10 then
        self:GenEnergy()
        self.thinkcount = 0
    end
    self:NextThink(CurTime() + 0.1)
    return true
end
