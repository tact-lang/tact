/**
 * Convert `./` imports to `@/` imports
 */

import { readFile, writeFile } from "fs/promises";
import { dirname, join, relative } from "path";
import { glob } from "glob";

const main = async () => {
    let hadChanges = false;
    const rootDir = join(__dirname, "..");
    for (const file of glob.sync("./src/**/*.ts", { cwd: rootDir })) {
        const fullPath = join(rootDir, file);
        const source = await readFile(fullPath, "utf-8");
        const newSource = source.replace(
            /from "([^"]*)"/g,
            (_, importedName) => {
                if (!importedName.startsWith(".")) {
                    return `from "${importedName}"`;
                }
                const x = relative(
                    "src/",
                    join(dirname(fullPath), importedName),
                );
                return `from "@/${x}"`;
            },
        );
        if (source !== newSource) {
            await writeFile(fullPath, newSource);
            hadChanges = true;
        }
    }
    if (hadChanges) {
        process.exit(30);
    }
};

void main();
