// TODO: move this to a standalone new rehype plugin

/**
 * @import {Root} from 'hast'
 */

import { visit } from 'unist-util-visit';
import { toString } from 'hast-util-to-string';
import {
  bundledLanguages,
  createHighlighter,
  createWasmOnigEngine,
} from 'shiki';
import { ExpressiveCodeTheme } from '@astrojs/starlight/expressive-code';
import fs from 'node:fs';

// Import custom grammars
const grammarTact = JSON.parse(fs.readFileSync(new URL('./grammars/grammar-tact.json', import.meta.url), 'utf-8'));
const grammarFunc = JSON.parse(fs.readFileSync(new URL('./grammars/grammar-func.json', import.meta.url), 'utf-8'));

// Import custom themes
const oneLightMod = ExpressiveCodeTheme.fromJSONString(fs.readFileSync(new URL('./themes/one-light-mod.jsonc', import.meta.url), 'utf-8'));

/**
 * Highlight inline code tags with Shiki.
 *
 * @typedef {{
     themeDark: 'one-dark-pro' | ExpressiveCodeTheme | import('shiki').BundledTheme;
     themeLight: typeof oneLightMod | import('shiki').BundledTheme;
   }} Options
 * @param {Readonly<Options> | null | undefined} options
 * @returns Transform.
 */
export default function rehypeInlineCodeHighlighting(options) {
  /**
   * @param {Root} tree
   * @return {undefined}
   */
  return async function(tree) {
    /** @type {{node: import('hast').Element, lang: string, code: string}[]} */
    const nodesToProcess = [];

    /** @type {Readonly<Options>} */
    const optConfig = options ?? {
      themeDark: 'one-dark-pro',
      themeLight: oneLightMod,
    };

    visit(tree, 'element', function(node, _num, parent) {
      if (node.tagName === 'code'
        && node.children.length === 1
        && node.children[0].type === "text"
        && node.children[0].value.match(/\{:\s*[a-zA-Z0-9_\-]+\s*\}\s*$/) !== null
        && parent !== undefined
        && parent.tagName !== 'pre') {
        // Obtain the string value
        const value = toString(node);

        // Match-out the inner language string
        const lang = value.match(/\{:\s*([a-zA-Z0-9_\-]+)\s*\}\s*$/)[1];
        const code = value.match(/(.*?)\s*\{:\s*[a-zA-Z0-9_\-]+\s*\}\s*$/)[1];

        // Save them for future processing
        nodesToProcess.push({ node, lang, code });
      }
    });

    // Prepare Shiki
    const hl = await createHighlighter({
      themes: [optConfig.themeDark, optConfig.themeLight],
      langs: [
        // ...Object.keys(bundledLanguages),
        bundledLanguages.javascript,
        bundledLanguages.typescript,
        bundledLanguages.json,
        bundledLanguages.markdown,
        bundledLanguages.bash,
        bundledLanguages.shell,
        bundledLanguages.bat,
        bundledLanguages.batch,
        bundledLanguages.powershell,
        grammarTact,
        grammarFunc,
      ],
      // TODO: Made the 'name' lowercase in the TextMate grammars
      langAlias: { fc: 'func' },
      engine: await createWasmOnigEngine(import('shiki/wasm')),
    });

    // Apply highlighting to each target node
    for (let i = 0; i < nodesToProcess.length; i += 1) {
      const res = hl.codeToHast(nodesToProcess[i].code.trim(), {
        lang: nodesToProcess[i].lang,
        structure: 'inline',
        themes: {
          dark: optConfig.themeDark,
          light: optConfig.themeLight,
        },
        defaultColor: false,
      });
      nodesToProcess[i].node.children = res.children;
    }

    // TODO: hoist preparation elsewhere?
    hl.dispose();
  }
}
