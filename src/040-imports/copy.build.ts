import * as fs from "fs/promises";
import * as path from "path";
import * as glob from "glob";

const cp = async (fromGlob: string, toPath: string) => {
    for (const file of glob.sync(path.join(fromGlob, "**/*"))) {
        const relPath = path.relative(fromGlob, file);
        const pathTo = path.join(toPath, relPath);
        const stat = await fs.stat(file);
        if (stat.isDirectory()) {
            await fs.mkdir(pathTo, { recursive: true });
        } else {
            await fs.mkdir(path.dirname(pathTo), { recursive: true });
            await fs.copyFile(file, pathTo);
        }
    }
};

const main = async () => {
    try {
        await cp("./src/040-imports/stdlib/", "./dist/040-imports/stdlib/");
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
};

void main();
