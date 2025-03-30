/**
 * Convert @/ imports to ./ imports
 */

import { glob, readFile, writeFile } from "fs/promises";
import { dirname, join, relative } from "path";

const main = async () => {
    const rootDir = join(__dirname, "..");
    for await (const file of glob("./dist/**/*.js", { cwd: rootDir })) {
        const fullPath = join(rootDir, file);
        const source = await readFile(fullPath, "utf-8");
        const newSource = source.replace(
            /require\("@\/([^"]*)"\)/g,
            (_, importedName) => {
                const result = relative(
                    dirname(fullPath),
                    join(__dirname, "dist", importedName),
                );
                const r = !result.startsWith(".") ? "./" + result : result;
                return `require("${r}")`;
            },
        );
        if (source !== newSource) {
            await writeFile(fullPath, newSource);
        }
    }

    for await (const file of glob("./dist/**/*.ts", { cwd: rootDir })) {
        const fullPath = join(rootDir, file);
        const source = await readFile(fullPath, "utf-8");
        const newSource = source.replace(
            /from "@\/([^"]*)"/g,
            (_, importedName) => {
                const result = relative(
                    dirname(fullPath),
                    join(__dirname, "dist", importedName),
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
