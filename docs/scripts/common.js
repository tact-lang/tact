import { spawnSync } from 'node:child_process';
import { tmpdir } from 'node:os';
import {
  mkdtempSync,
  readFileSync,
  writeFileSync,
  readdirSync,
  statSync,
} from 'node:fs';
import { chdir, cwd } from 'node:process';
import { dirname } from 'node:path';
import { fileURLToPath } from 'node:url';

// TODO(?): Use git for this instead, since scripts/ might move some day
//          and CI might change the starting working directory as well
// chdir(`${__dirname}/../../`); // docs, presumably

/*******************/
/* Utility helpers */
/*******************/

/** The `__dirname` replacement for ESM */
export const __dirname = dirname(fileURLToPath(import.meta.url));

/** Default directory for temporary files with / separator (because even PowerShell can use direct slash) */
export const globalTmpDir = tmpdir() + '/';

/**
 * Obtains the list of files with target extension in the target directory and its
 * sub-directories as a flat array of names.
 *
 * @param dir {string | undefined} defaults to "." (current directory)
 * @param extension {string | undefined} defaults to any file
 * @returns {string[]}
 */
export const getFileNames = (dir, extension) => {
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
export const extractTactCodeBlocks = (src) => {
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
    let code = regexMatches[i].at(2)?.trimStart();
    // let code = regexMatches[i].at(2)?.trim();
    if (code === undefined || code.length === 0) {
      console.log(`Error: regex failed when processing code blocks of:\n\n${src}`);
      process.exit(1);
    }

    // See if the `code` needs additional wrapping in a global function or not
    // i.e. if it doesn't contain any module-level items (implicit convention in Tact docs)
    // This approach is rather brittle, but good enough for the time being.
    const moduleItems = code.split('\n').filter((line) => {
      const matchRes = line.match(/^\s*(?:import|primitive|const|asm|fun|extends|mutates|virtual|override|inline|abstract|@name|@interface|contract|trait|struct(?!\s*:)|message(?!\s*(?::|\(\s*M|\(\s*\))))\b/);

      if (matchRes === null) { return false; }
      else { return true; }
    });

    if (moduleItems.length === 0) {
      // The extra manipulations below are needed to keep the code blocks well-formatted
      let lines = code.split('\n');
      lines.pop();
      const linesCollected = lines
        .map(line => line.trim() ? '    ' + line : '')
        .join('\n');
      code = `fun showcase() {\n${linesCollected}\n}\n`;
    }

    // Save the code
    res.push(code);
  }

  return res;
};

/**
 * @param filepaths {string[]} an array of paths to .mdx files
 * @param actionCheck {(filepath: string) => { ok: true } | { ok: false, error: string }}
 */
export const processMdxFiles = (filepaths, actionCheck) => {
  for (const filepath of filepaths) {
    const file = readFileSync(filepath, { encoding: 'utf8' });
    const codeBlocks = extractTactCodeBlocks(file);
    const tmpDirForCurrentPage = mkdtempSync(globalTmpDir);
    const pageName = filepath.slice(
      filepath.lastIndexOf('/') + 1,
      filepath.lastIndexOf('.mdx'),
    );

    for (let j = 0; j < codeBlocks.length; j += 1) {
      const tactFilePath = `${tmpDirForCurrentPage}/${pageName}-block-${(j + 1).toString()}.tact`;
      writeFileSync(tactFilePath, codeBlocks[j], { encoding: 'utf8', mode: '644' });
      console.log(`Checking ${tactFilePath}`);

      // TODO(?):
      // An alternative solution to individual checks
      // would be to prepare a tact.config.json on the fly
      const savedCwd = cwd();
      chdir(tmpDirForCurrentPage);

      // Perform individual checks
      const checkRes = actionCheck(tactFilePath);
      chdir(savedCwd);

      if (checkRes.ok === false) {
        // NOTE: This line is handy for debugging
        // console.log(readFileSync(tactFilePath).toString());
        console.log(`Error: check of ${tactFilePath} has failed:\n\n${checkRes.error}`);
        process.exit(1);
      }
    }
  }
};

/*****************************/
/* Actions or checks to take */
/*****************************/

/**
 * @requires Node.js 22+ with npm installed
 * @param filepath {string} a path to Tact file
 * @returns {{ ok: true } | { ok: false, error: string }}
 */
export const actionTypecheckTactFile = (filepath) => {
  // Using the built Tact compiler from the parent folder to
  // 1. Ensure everything still builds
  // 2. Prevent excessive compiler downloads in CI
  const res = spawnSync('node',
    [`${__dirname}/../../bin/tact.js`, '--check', filepath],
    { encoding: 'utf8' }
  );

  if (res.status !== 0) {
    return {
      ok: false,
      error: res.stdout + res.stderr,
    };
  }

  return { ok: true };
};

/**
 * @requires Node.js 22+ with npm installed
 * @param filepath {string} a path to Tact file
 * @returns {{ ok: true } | { ok: false, error: string }}
 */
export const actionCheckFmtTactFile = (filepath) => {
  const res = spawnSync('node',
    [`${__dirname}/../../bin/tact-fmt.js`, '--check', filepath],
    { encoding: 'utf8' }
  );

  if (res.status !== 0) {
    return {
      ok: false,
      error: res.stdout + res.stderr,
    };
  }

  return { ok: true };
};
