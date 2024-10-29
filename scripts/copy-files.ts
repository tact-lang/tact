import * as fs from "node:fs/promises";
import * as path from "node:path";

const cp = async (fromGlob: string, toPath: string) => {
    for await (const file of fs.glob(fromGlob)) {
        await fs.copyFile(file, path.join(toPath, path.basename(file)));
    }
};

const main = async () => {
    try {
        await cp("./src/grammar/grammar.ohm*", "./dist/grammar/");
        await cp("./src/func/funcfiftlib.*", "./dist/func/");
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
};

void main();
