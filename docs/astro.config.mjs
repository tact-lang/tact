// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import { ExpressiveCodeTheme } from '@astrojs/starlight/expressive-code';
import fs from 'node:fs';

// Allows changing heading ids
import remarkHeadingId from 'remark-custom-heading-id';

// Makes heading ids auto-create themselves
import { rehypeHeadingIds } from '@astrojs/markdown-remark';
import rehypeAutolinkHeadings from 'rehype-autolink-headings';

// Adds support for rendering math
import remarkMath from 'remark-math';
import rehypeKatex from 'rehype-katex';

// Adds links to Web IDE from code blocks
import remarkLinksToWebIDE from './links-to-web-ide';

// Adds syntax highlighting for inline code blocks
import rehypeInlineCodeHighlighting from './inline-code-highlighting';

// Add validation of internal links during production builds
import starlightLinksValidator from 'starlight-links-validator';

// Add generation of llms.txt, llms-full.txt and llms-small.txt
import starlightLllmsTxt from 'starlight-llms-txt';

// https://astro.build/config
// https://starlight.astro.build/reference/configuration/
export default defineConfig({
	outDir: './dist', // default, just to be sure
	site: 'https://docs.tact-lang.org',
	markdown: {
		remarkPlugins: [remarkHeadingId, remarkMath, remarkLinksToWebIDE],
		rehypePlugins: [
			rehypeHeadingIds,
			[rehypeAutolinkHeadings, {
				behavior: "append",
				properties: {
					class: "autolink-header",
					ariaHidden: "true",
					ariaLabel: "Link to this header",
					tabIndex: -1,
				},
			}],
			rehypeInlineCodeHighlighting,
			rehypeKatex,
		],
	},
	integrations: [
		starlight({
			title: {
				en: '⚡ Tact Documentation',
				'zh-CN': '⚡ Tact 语言文档',
			},
			titleDelimiter: undefined,
			favicon: '/favicon.ico',
			logo: {
				dark: '/public/logo-dark.svg',
				light: '/public/logo-light.svg',
				alt: '⚡ Tact Documentation',
				replacesTitle: true,
			},
			// 'head' is auto-populated with SEO-friendly contents based on the page frontmatters
			head: [
				{
					// Google tag (gtag.js)
					tag: "script",
					attrs: { async: true, src: 'https://www.googletagmanager.com/gtag/js?id=G-ZJ3GZHJ0Z5' }
				},
				{
					// Per-page Google tag setup
					tag: "script",
					content: "window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments)}gtag('js',new Date());gtag('config','G-ZJ3GZHJ0Z5');",
				},
			],
			social: {
				github: 'https://github.com/tact-lang/tact',
				telegram: 'https://t.me/tactlang',
				"x.com": 'https://x.com/tact_language',
			},
			editLink: { baseUrl: 'https://github.com/tact-lang/tact/edit/main/docs/' },
			tableOfContents: { minHeadingLevel: 2, maxHeadingLevel: 4 },
			expressiveCode: {
				themes: ['one-dark-pro', ExpressiveCodeTheme.fromJSONString(
					fs.readFileSync(new URL(`./themes/one-light-mod.jsonc`, import.meta.url), 'utf-8')
				)],
				useStarlightDarkModeSwitch: true,
				useStarlightUiThemeColors: true,
				shiki: {
					langs: [
						() => JSON.parse(fs.readFileSync('grammars/grammar-tact.json', 'utf-8')),
						() => JSON.parse(fs.readFileSync('grammars/grammar-func.json', 'utf-8')),
					],
				},
			},
			customCss: [
				// To adjust Starlight colors and styles
				'./src/starlight.custom.css',
				// To properly support KaTeX
				'./src/fonts/katex.fontfaces.css',
				'./src/katex.min.css',
			],
			plugins: [
				starlightLinksValidator({
					errorOnFallbackPages: false,
					// errorOnInvalidHashes: false,
				}),
				starlightLllmsTxt({
					description: 'Tact is a powerful programming language for TON Blockchain focused on efficiency and simplicity. It is designed to be easy to learn and use, and to be a good fit for smart contracts.',
					pageSeparator: '\n\n---\n\n',
					exclude: [
						// Excluding /ecosystem from llms-small.txt as it brings little value
						// for LLMs and humans (as of now)
						'ecosystem',
						'ecosystem/**',
					],
					minify: {
						note: false, // keep note asides
						customSelectors: [
							"a.web-ide-link" // "Open in Web IDE" links
						],
					},
				}),
			],
			credits: false,
			lastUpdated: true,
			disable404Route: false,
			// Note that UI translations are bundled by Starlight for many languages:
			// https://starlight.astro.build/guides/i18n/#translate-starlights-ui
			//
			// To use fallback content and translation notices provided by Starlight,
			// files across language folders must be named the same!
			defaultLocale: 'root', // removes language prefix from English pages
			locales: {
				root: {
					label: 'English',
					lang: 'en', // lang is required for root locales
				},
				'zh-cn': {
					label: '简体中文',
					lang: 'zh-CN',
				},
			},
			// In place of countless meta.js files in old docs:
			sidebar: [
				{
					label: 'Book',
					translations: {
						'zh-CN': '图书',
					},
					items: [
						{ slug: 'book' },
						{ slug: 'book/learn-tact-in-y-minutes' },
						// NOTE: saved for coming from other blockchains / languages
						// {
						// 	label: 'Cheatsheets',
						// 	translations: {
						// 		'zh-CN': '小抄',
						// 	},
						// 	collapsed: true,
						// 	autogenerate: { directory: 'book/cs' },
						// },
						{
							label: 'Fundamentals of Tact',
							translations: { 'zh-CN': 'Tact 语言基础' },
							attrs: { class: 'sidebar-separator' },
							link: 'book/types#',
						},
						{ slug: 'book/types' },
						{ slug: 'book/integers' },
						{ slug: 'book/cells' },
						{ slug: 'book/maps' },
						{ slug: 'book/structs-and-messages' },
						{ slug: 'book/optionals' },
						{ slug: 'book/contracts' },
						{ slug: 'book/exit-codes' },
						{
							label: 'Expressiveness',
							translations: { 'zh-CN': '表达能力' },
							attrs: { class: 'sidebar-separator' },
							link: 'book/operators#',
						},
						{ slug: 'book/operators' },
						{ slug: 'book/expressions' },
						{ slug: 'book/statements' },
						{ slug: 'book/constants' },
						{
							slug: 'book/functions',
							badge: { variant: 'tip', text: 'new' },
						},
						{ slug: 'book/assembly-functions' },
						{
							label: 'Communication',
							translations: { 'zh-CN': '通信' },
							attrs: { class: 'sidebar-separator' },
							link: 'book/receive#',
						},
						{ slug: 'book/receive' },
						{ slug: 'book/bounced' },
						{ slug: 'book/external' },
						{ slug: 'book/lifecycle' },
						{ slug: 'book/send' },
						{ slug: 'book/message-mode' },
						{
							label: 'Going places',
							translations: { 'zh-CN': '前往各地' },
							attrs: { class: 'sidebar-separator' },
							link: 'book/compile#',
						},
						{ slug: 'book/compile' },
						{ slug: 'book/debug' },
						{ slug: 'book/deploy' },
						{ slug: 'book/upgrades' },
						{ slug: 'book/import' },
						{ slug: 'book/config' },
						{ slug: 'book/func' },
						{ slug: 'book/gas-best-practices' },
						{ slug: 'book/security-best-practices' },
					],
				},
				{
					label: 'Cookbook',
					translations: {
						'zh-CN': '食谱',
					},
					items: [
						{ slug: 'cookbook' },
						{
							label: 'Single contract',
							translations: { 'zh-CN': '单一合约' },
							attrs: { class: 'sidebar-separator' },
							link: 'cookbook/single-communication#',
						},
						{ slug: 'cookbook/single-communication' },
						{ slug: 'cookbook/type-conversion' },
						{ slug: 'cookbook/data-structures' },
						{ slug: 'cookbook/algo' },
						{ slug: 'cookbook/time' },
						{ slug: 'cookbook/access' },
						{ slug: 'cookbook/random' },
						{ slug: 'cookbook/upgrades' },
						{ slug: 'cookbook/misc' },
						{
							label: 'Multiple contracts',
							translations: { 'zh-CN': '多重合约' },
							attrs: { class: 'sidebar-separator' },
							link: 'cookbook/multi-communication#',
						},
						{ slug: 'cookbook/multi-communication' },
						{ slug: 'cookbook/jettons' },
						{ slug: 'cookbook/nfts' },
						{
							label: 'Decentralized EXchanges (DEXes)',
							translations: {
								'zh-CN': '去中心化交易所（DEXes）',
							},
							collapsed: true,
							autogenerate: { directory: 'cookbook/dexes' }
						},
					],
				},
				{
					label: 'Reference',
					translations: {
						'zh-CN': '参考',
					},
					items: [
						{ slug: 'ref' },
						{ slug: 'ref/spec' },
						{
							'label': 'Evolution',
							translations: {
								'zh-CN': '演变',
							},
							collapsed: true,
							autogenerate: { directory: 'ref/evolution' }
						},
						{
							label: 'Core library',
							translations: { 'zh-CN': '核心库' },
							attrs: { class: 'sidebar-separator' },
							link: 'ref/core-base#',
						},
						{ slug: 'ref/core-base' },
						{ slug: 'ref/core-send' },
						{ slug: 'ref/core-contextstate' },
						{ slug: 'ref/core-comptime' },
						{ slug: 'ref/core-cells' },
						{ slug: 'ref/core-addresses' },
						{ slug: 'ref/core-strings' },
						{ slug: 'ref/core-debug' },
						{ slug: 'ref/core-gas' },
						{ slug: 'ref/core-crypto' },
						{ slug: 'ref/core-math' },
						{ slug: 'ref/core-random' },
						{
							label: 'Standard libraries',
							translations: { 'zh-CN': '标准库' },
							attrs: { class: 'sidebar-separator' },
							link: 'ref/standard-libraries#',
						},
						{ slug: 'ref/standard-libraries' },
						{ slug: 'ref/stdlib-config' },
						{ slug: 'ref/stdlib-content' },
						{ slug: 'ref/stdlib-deploy' },
						{ slug: 'ref/stdlib-dns' },
						{ slug: 'ref/stdlib-ownable' },
						{ slug: 'ref/stdlib-stoppable' },
					],
				},
				{
					label: 'Ecosystem',
					translations: {
						'zh-CN': '生态系统',
					},
					items: [
						{ slug: 'ecosystem' },
						{ slug: 'ecosystem/security-audits' },
						{
							label: 'Tools',
							translations: { 'zh-CN': '工具' },
							attrs: { class: 'sidebar-separator' },
							link: 'ecosystem/typescript#',
						},
						{ slug: 'ecosystem/typescript' },
						{ slug: 'ecosystem/vscode' },
						{ slug: 'ecosystem/jetbrains' },
						{ slug: 'ecosystem/misti' },
					],
				},
				{
					label: '⭐ Awesome Tact →',
					link: 'https://github.com/tact-lang/awesome-tact',
				},
				{
					label: '✈️ Telegram Chat →',
					link: 'https://t.me/tactlang',
					attrs: { target: '_blank' }
				},
				{
					label: '🐦 X/Twitter →',
					link: 'https://twitter.com/tact_language',
					attrs: { target: '_blank' }
				}
			],
		}),
	],
	redirects: {
		'/ecosystem/tools/overview': '/ecosystem',
		'/ecosystem/tools/typescript': '/ecosystem/typescript',
		'/ecosystem/tools/jetbrains': '/ecosystem/jetbrains',
		'/ecosystem/tools/vscode': '/ecosystem/vscode',
		'/ecosystem/tools/misti': '/ecosystem/misti',
		'/ref/core-common': '/ref/core-send',
		'/ref/core-advanced': '/ref/core-contextstate',
	},
});
