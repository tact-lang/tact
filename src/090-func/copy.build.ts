import * as fs from "fs/promises";
import * as path from "path";
import * as glob from "glob";

const cp = async (fromGlob: string, toPath: string) => {
    const files = glob.sync(fromGlob);
    for (const file of files) {
        await fs.copyFile(file, path.join(toPath, path.basename(file)));
    }
};

const main = async () => {
    try {
        await cp("./src/090-func/funcfiftlib.*", "./dist/090-func/");
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
};

void main();
