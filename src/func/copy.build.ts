import * as fs from "node:fs/promises";
import * as path from "node:path";
import * as glob from "glob";

const cp = async (fromGlob: string, toPath: string) => {
    const files = glob.sync(fromGlob);
    for (const file of files) {
        await fs.copyFile(file, path.join(toPath, path.basename(file)));
    }
};

const main = async () => {
    try {
        await cp("./src/func/funcfiftlib.*", "./dist/func/");
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
};

void main();
