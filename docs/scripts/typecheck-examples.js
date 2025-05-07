/*─────────────────────────────────────────────────────────────────────────────╗
│                                IMPORTANT:                                    │
│  Run this script from the root of the docs, not from the scripts directory!  │
╞══════════════════════════════════════════════════════════════════════════════╡
│  The script:                                                                 │
│  1. Goes over every file in Cookbook and some additional, selected pages     │
│  2. Extracts the Tact code blocks from them                                  │
│  3. For every code block, it runs the latest version of the Tact compiler    │
│     from the main branch, performing the syntax and type checking (--check)  │
│  4. If there are any errors, outputs them and exits                          │
│                                                                              │
│  Checks take ~0.5 seconds per code block, so lets mostly use it for Cookbook │
╚─────────────────────────────────────────────────────────────────────────────*/

import { existsSync } from 'node:fs';
import {
  getFileNames,
  actionTypecheckTactFile,
  processMdxFiles,
} from './common.js';

/** @type string */
const cookbookPath = "src/content/docs/cookbook";

if (!existsSync(cookbookPath)) {
  console.log(`Error: path ${cookbookPath} doesn't exist, ensure that you're in the right directory!`);
  process.exit(1);
}

/** @type string[] */
const mdxFileNames = getFileNames(cookbookPath, ".mdx");

// Also check some special pages
mdxFileNames.push('src/content/docs/book/learn-tact-in-y-minutes.mdx');
processMdxFiles(mdxFileNames, actionTypecheckTactFile);
