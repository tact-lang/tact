/**
 * Convert @/ imports to ./ imports
 */

import { readFile, writeFile } from "fs/promises";
import { dirname, join, relative } from "path";
import { glob } from "glob";

const main = async () => {
    const rootDir = join(__dirname, "..");
    for (const file of glob.sync("./dist/**/*.js", { cwd: rootDir })) {
        const fullPath = join(rootDir, file);
        const source = await readFile(fullPath, "utf-8");
        const newSource = source.replace(
            /require\("@\/([^"]*)"\)/g,
            (_, importedName) => {
                const result = relative(
                    dirname(fullPath),
                    join(rootDir, "dist", importedName),
                );
                const r = !result.startsWith(".") ? "./" + result : result;
                return `require("${r}")`;
            },
        );
        if (source !== newSource) {
            await writeFile(fullPath, newSource);
        }
    }

    for await (const file of glob.sync("./dist/**/*.ts", { cwd: rootDir })) {
        const fullPath = join(rootDir, file);
        const source = await readFile(fullPath, "utf-8");
        const newSource = source.replace(
            /from "@\/([^"]*)"/g,
            (_, importedName) => {
                const result = relative(
                    dirname(fullPath),
                    join(rootDir, "dist", importedName),
                );
                const r = !result.startsWith(".") ? "./" + result : result;
                return `from "${r}"`;
            },
        );
        if (source !== newSource) {
            await writeFile(fullPath, newSource);
        }
    }
};

void main();
