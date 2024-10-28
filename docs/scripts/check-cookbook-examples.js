/*─────────────────────────────────────────────────────────────────────────────╗
│                                IMPORTANT:                                    │
│  Run this script from the root of the docs, not from the scripts directory!  │
╞══════════════════════════════════════════════════════════════════════════════╡
│  The script:                                                                 │
│  1. Goes over every file in Cookbook                                         │
│  2. Extracts the Tact code blocks from them                                  │
│  3. For every code block, it runs the latest publicly available version      │
│     of the Tact compiler, performing the syntax and type checking (--check)  │
│  4. If there are any errors, outputs them and exits                          │
│                                                                              │
│  Checks take ~0.5 seconds per code block, so lets use it for Cookbook only   │
╚─────────────────────────────────────────────────────────────────────────────*/

import { spawnSync } from 'node:child_process';
import { tmpdir } from 'node:os';
import {
  mkdtempSync,
  mkdtemp,
  readFileSync,
  readdirSync,
  statSync,
  writeFileSync,
  existsSync,
} from 'node:fs';
import { chdir, cwd } from 'node:process';
// TODO(?): check the proper dir (from git) and automatically change the working dir

/*******************/
/* Utility helpers */
/*******************/

/** Default directory for temporary files with / separator (because even PowerShell can use direct slash) */
const globalTmpDir = tmpdir() + '/';

/**
 * Obtains the list of files with target extension in the target directory and its
 * sub-directories as a flat array of names.
 *
 * @param dir {string | undefined} defaults to "." (current directory)
 * @param extension {string | undefined} defaults to any file
 * @returns {string[]}
 */
const getFileNames = (dir, extension) => {
  /**
   * @param dir {string | undefined}
   * @param extension {string | undefined}
   * @returns {string[]}
   */
  const recGetFileNames = (dir, extension, _files) => {
    _files = _files || [];
    let files = readdirSync(dir);
    for (let i in files) {
      let name = dir + '/' + files[i];
      if (statSync(name).isDirectory()) {
        recGetFileNames(name, extension, _files);
        continue;
      }
      if (extension === undefined || name.endsWith(extension)) {
        _files.push(name.trim());
      }
    }
    return _files;
  };

  return recGetFileNames(dir ?? ".", extension);
};

/**
 * @param src {string} source of the .md or .mdx file to extract code blocks from
 * @returns {string[]} all Tact code blocks on the page ready to be processed
 */
const extractTactCodeBlocks = (src) => {
  /** @type RegExpExecArray[] */
  const regexMatches = [...src.matchAll(/```(\w*).*?\n([\s\S]*?)```/gm)];
  /** @type string[] */
  let res = [];

  for (let i = 0; i < regexMatches.length; i += 1) {
    // Skip non-Tact matches
    if (regexMatches[i].at(1)?.trim() !== "tact") {
      continue;
    }

    // Guard the contents
    let code = regexMatches[i].at(2)?.trim();
    if (code === undefined || code.length === 0) {
      console.log(`Error: regex failed when processing code blocks of:\n\n${src}`);
      process.exit(1);
    }

    // See if the `code` needs additional wrapping in a global function or not
    // i.e. if it doesn't contain any module-level items (implicit convention in Tact docs):
    const moduleItems = code.split('\n').filter((line) => {
      const matchRes = line.match(/^\s*(?:import|primitive|const|asm|fun|extends|mutates|virtual|override|inline|abstract|@name|@interface|contract|trait|struct|message)\b/);

      if (matchRes === null) { return false; }
      else { return true; }
    });

    if (moduleItems.length === 0) {
      code = `fun _() {\n${code}\n}`;
    }

    // Save the code
    res.push(code);
  }

  return res;
};

/**
 * @requires Node.js 22+ with npm installed
 * @param filepath {string} a path to Tact file
 * @returns {{ ok: true } | { ok: false, error: string }}
 */
const checkTactFile = (filepath) => {
  // Using the latest publicly available compiler to ensure that current users
  // can compile and run the code, not just the compiler developers
  const res = spawnSync('npx',
    ['-y', '@tact-lang/compiler@latest', '--check', filepath],
    { encoding: 'utf8' }
  );

  if (res.status !== 0) {
    return {
      ok: false,
      error: res.stdout + res.stderr,
    }
  }

  return { ok: true };
};

/**********/
/* Script */
/**********/

/** @type string */
const cookbookPath = "src/content/docs/cookbook";

if (!existsSync(cookbookPath)) {
  console.log(`Error: path ${cookbookPath} doesn't exist, ensure that you're in the right directory!`);
  process.exit(1);
}

/** @type string[] */
const mdxFileNames = getFileNames(cookbookPath, ".mdx");

for (let i = 0; i < mdxFileNames.length; i += 1) {
  const file = readFileSync(mdxFileNames[i], { encoding: 'utf8' });
  const codeBlocks = extractTactCodeBlocks(file);
  const tmpDirForCurrentPage = mkdtempSync(globalTmpDir);
  const pageName = mdxFileNames[i].slice(
    mdxFileNames[i].lastIndexOf('/') + 1,
    mdxFileNames[i].lastIndexOf('.mdx'),
  );

  for (let j = 0; j < codeBlocks.length; j += 1) {
    const tactFile = `${tmpDirForCurrentPage}/${pageName}-block-${(j + 1).toString()}.tact`;
    writeFileSync(tactFile, codeBlocks[j], { encoding: 'utf8', mode: '644' });
    console.log(`Checking ${tactFile}`);

    // TODO(?): Alternative solution would be to prepare a tact.config.json on the fly
    const savedCwd = cwd();
    chdir(tmpDirForCurrentPage);

    // Perform individual checks (see TODO above)
    const checkRes = checkTactFile(tactFile);
    chdir(savedCwd);
    
    if (checkRes.ok === false) {
      console.log(`Error: check of ${tactFile} has failed:\n\n${checkRes.error}`);
      process.exit(1);
    }
  }
}
