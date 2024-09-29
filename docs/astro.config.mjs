// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import fs from 'node:fs';

// Allows changing heading ids
import remarkHeadingId from 'remark-custom-heading-id';

// Makes heading ids auto-create themselves
import { rehypeHeadingIds } from '@astrojs/markdown-remark';
import rehypeAutolinkHeadings from 'rehype-autolink-headings';

// Adds support for rendering math
import remarkMath from 'remark-math';
import rehypeKatex from 'rehype-katex';

// Adds syntax highlighting for inline code blocks
import rehypeInlineCodeHighlighting from './inline-code-highlighting';

// Add validation of internal links during production builds
import starlightLinksValidator from 'starlight-links-validator';

// https://astro.build/config
// https://starlight.astro.build/reference/configuration/
export default defineConfig({
	outDir: './dist', // default, just to be sure
	site: 'https://docs.tact-lang.org',
	markdown: {
		remarkPlugins: [remarkHeadingId, remarkMath],
		rehypePlugins: [
			rehypeHeadingIds,
			[rehypeAutolinkHeadings, {
				behavior: "append",
				properties: {
					class: "autolink-header",
					ariaHidden: true,
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
				'zh-CN': '⚡ Tact Documentation',
			},
			titleDelimiter: '-',
			favicon: '/favicon.png',
			logo: {
				dark: '/public/logo-dark.svg',
				light: '/public/logo-light.svg',
				alt: '⚡ Tact Documentation',
				replacesTitle: true,
			},
			// 'head' is auto-populated with SEO-friendly contents
			social: {
				github: 'https://github.com/tact-lang/tact',
				telegram: 'https://t.me/tactlang',
				"x.com": 'https://x.com/tact_language',
			},
			editLink: { baseUrl: 'https://github.com/tact-lang/tact/edit/main/docs/' },
			tableOfContents: { minHeadingLevel: 2, maxHeadingLevel: 4 },
			expressiveCode: {
				themes: ['one-dark-pro', 'one-light'],
				useStarlightDarkModeSwitch: true,
				useStarlightUiThemeColors: true,
				shiki: {
					langs: [
						() => JSON.parse(fs.readFileSync('grammars/grammar-tact.json', 'utf-8')),
						() => JSON.parse(fs.readFileSync('grammars/grammar-func.json', 'utf-8')),
						() => JSON.parse(fs.readFileSync('grammars/grammar-ohm.json', 'utf-8'))
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
			plugins: [starlightLinksValidator({
				errorOnFallbackPages: false,
				// errorOnInvalidHashes: false,
			})],
			credits: false,
			lastUpdated: true,
			disable404Route: false,
			// Note, that UI translations are bundled by Starlight for many languages:
			// https://starlight.astro.build/guides/i18n/#translate-starlights-ui
			//
			// Also note, that in order to use fallback content and translation notices
			// provided by Starlight, files across language folders must be named the same!
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
						'book',
						{
							label: 'Cheatsheets',
							translations: {
								'zh-CN': '小抄',
							},
							collapsed: true,
							autogenerate: { directory: 'book/cs' },
						},
						{
						  label: 'Fundamentals of Tact',
						  translations: { 'zn-CN': 'Tact 语言基础' },
						  link: '#', attrs: { class: 'sidebar-separator' }
						},
						'book/types',
						'book/integers',
						'book/cells',
						'book/maps',
						'book/structs-and-messages',
						'book/optionals',
						'book/contracts',
						'book/exit-codes',
						{
						  label: 'Expressiveness',
						  translations: { 'zn-CN': '表现力' },
						  link: '#', attrs: { class: 'sidebar-separator' }
						},
						'book/operators',
						'book/expressions',
						'book/statements',
						'book/constants',
						'book/functions',
						{
						  label: 'Communication',
						  translations: { 'zn-CN': '交流' },
						  link: '#', attrs: { class: 'sidebar-separator' }
						},
						'book/receive',
						'book/bounced',
						'book/external',
						'book/lifecycle',
						'book/send',
						'book/message-mode',
						{
						  label: 'Going places',
						  translations: { 'zn-CN': '前往各地' },
						  link: '#', attrs: { class: 'sidebar-separator' }
						},
						'book/deploy',
						'book/debug',
						'book/upgrades',
						'book/import',
						'book/config',
						'book/masterchain',
						'book/func',
						'book/programmatic',
					],
				},
				{
					label: 'Cookbook',
					translations: {
						'zh-CN': '食谱',
					},
					items: [
						'cookbook',
						{
						  label: 'Single contract',
						  translations: { 'zn-CN': '单一合同' },
						  link: '#', attrs: { class: 'sidebar-separator' }
						},
						'cookbook/single-communication',
						'cookbook/type-conversion',
						'cookbook/data-structures',
						'cookbook/algo',
						'cookbook/time',
						'cookbook/access',
						'cookbook/random',
						'cookbook/misc',
						{
						  label: 'Multiple contracts',
						  translations: { 'zn-CN': '多重合同' },
						  link: '#', attrs: { class: 'sidebar-separator' }
						},
						'cookbook/multi-communication',
						'cookbook/jettons',
						'cookbook/nfts',
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
						'ref',
						'ref/spec',
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
						  translations: { 'zn-CN': '核心图书馆' },
						  link: '#', attrs: { class: 'sidebar-separator' }
						},
						'ref/core-base',
						'ref/core-common',
						'ref/core-comptime',
						'ref/core-debug',
						'ref/core-random',
						'ref/core-math',
						'ref/core-strings',
						'ref/core-cells',
						'ref/core-advanced',
						{
						  label: 'Standard libraries',
						  translations: { 'zn-CN': '标准图书馆' },
						  link: '#', attrs: { class: 'sidebar-separator' }
						},
						'ref/standard-libraries',
						'ref/stdlib-config',
						'ref/stdlib-content',
						'ref/stdlib-deploy',
						'ref/stdlib-dns',
						'ref/stdlib-ownable',
						'ref/stdlib-stoppable',
					],
				},
				{
					label: 'Ecosystem',
					translations: {
						'zh-CN': '生态系统',
					},
					items: [
						'ecosystem',
						{
						  label: 'Tools',
						  translations: { 'zn-CN': '工具' },
						  link: '#', attrs: { class: 'sidebar-separator' }
						},
						'ecosystem/typescript',
						'ecosystem/vscode',
						'ecosystem/jetbrains',
						'ecosystem/misti',
					],
				},
				{
					label: '✈️ Telegram →',
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
	},
});
