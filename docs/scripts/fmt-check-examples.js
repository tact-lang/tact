/*─────────────────────────────────────────────────────────────────────────────╗
│                                IMPORTANT:                                    │
│  Run this script from the root of the docs, not from the scripts directory!  │
╞══════════════════════════════════════════════════════════════════════════════╡
│  The script:                                                                 │
│  1. Goes over every file in Cookbook                                         │
│  2. Extracts the Tact code blocks from them                                  │
│  3. For every code block, it runs the latest version of the Tact formatter   │
│     from the main branch, performing the necessary checks                    │
│  4. If there are any errors, outputs them and exits                          │
╚─────────────────────────────────────────────────────────────────────────────*/

import { existsSync } from 'node:fs';
import {
  getFileNames,
  actionCheckFmtTactFile,
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
processMdxFiles(mdxFileNames, actionCheckFmtTactFile);
