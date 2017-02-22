/*
 * Project spacebuild
 * Copyright Spacebuild project (http://github.com/spacebuild)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 *  limitations under the License.
 */

/* http://prismjs.com/download.html?themes=prism-dark&languages=lua&plugins=line-numbers */
/**
 * prism.js Dark theme for JavaScript, CSS and HTML
 * Based on the slides of the talk “/Reg(exp){2}lained/”
 * @author Lea Verou
 */

code[class*="language-"],
pre[class*="language-"] {
	color: white;
	background: none;
	text-shadow: 0 -.1em .2em black;
	font-family: Consolas, Monaco, 'Andale Mono', 'Ubuntu Mono', monospace;
	text-align: left;
	white-space: pre;
	word-spacing: normal;
	word-break: normal;
	word-wrap: normal;
	line-height: 1.5;

	-moz-tab-size: 4;
	-o-tab-size: 4;
	tab-size: 4;

	-webkit-hyphens: none;
	-moz-hyphens: none;
	-ms-hyphens: none;
	hyphens: none;
}

@media print {
	code[class*="language-"],
	pre[class*="language-"] {
		text-shadow: none;
	}
}

pre[class*="language-"],
:not(pre) > code[class*="language-"] {
	background: hsl(30, 20%, 25%);
}

/* Code blocks */
pre[class*="language-"] {
	padding: 1em;
	margin: .5em 0;
	overflow: auto;
	border: .3em solid hsl(30, 20%, 40%);
	border-radius: .5em;
	box-shadow: 1px 1px .5em black inset;
}

/* Inline code */
:not(pre) > code[class*="language-"] {
	padding: .15em .2em .05em;
	border-radius: .3em;
	border: .13em solid hsl(30, 20%, 40%);
	box-shadow: 1px 1px .3em -.1em black inset;
	white-space: normal;
}

.token.comment,
.token.prolog,
.token.doctype,
.token.cdata {
	color: hsl(30, 20%, 50%);
}

.token.punctuation {
	opacity: .7;
}

.namespace {
	opacity: .7;
}

.token.property,
.token.tag,
.token.boolean,
.token.number,
.token.constant,
.token.symbol {
	color: hsl(350, 40%, 70%);
}

.token.selector,
.token.attr-name,
.token.string,
.token.char,
.token.builtin,
.token.inserted {
	color: hsl(75, 70%, 60%);
}

.token.operator,
.token.entity,
.token.url,
.language-css .token.string,
.style .token.string,
.token.variable {
	color: hsl(40, 90%, 60%);
}

.token.atrule,
.token.attr-value,
.token.keyword {
	color: hsl(350, 40%, 70%);
}

.token.regex,
.token.important {
	color: #e90;
}

.token.important,
.token.bold {
	font-weight: bold;
}
.token.italic {
	font-style: italic;
}

.token.entity {
	cursor: help;
}

.token.deleted {
	color: red;
}

pre.line-numbers {
	position: relative;
	padding-left: 3.8em;
	counter-reset: linenumber;
}

pre.line-numbers > code {
	position: relative;
}

.line-numbers .line-numbers-rows {
	position: absolute;
	pointer-events: none;
	top: 0;
	font-size: 100%;
	left: -3.8em;
	width: 3em; /* works for line-numbers below 1000 lines */
	letter-spacing: -1px;
	border-right: 1px solid #999;

	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;

}

	.line-numbers-rows > span {
		pointer-events: none;
		display: block;
		counter-increment: linenumber;
	}

		.line-numbers-rows > span:before {
			content: counter(linenumber);
			color: #999;
			display: block;
			padding-right: 0.8em;
			text-align: right;
		}
