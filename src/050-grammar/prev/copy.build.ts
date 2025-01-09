import * as fs from "fs/promises";
import * as path from "path";
import * as glob from "glob";

const cp = async (fromGlob: string, toPath: string) => {
    const files = glob.sync(fromGlob);
    for (const file of files) {
        await fs.copyFile(file, path.join(toPath, path.basename(file)));
    }
};

const fromPath = path.join(__dirname, "/grammar.ohm*");
const toPath = path.join(__dirname, "../../../dist/050-grammar/prev/");

const main = async () => {
    try {
        await cp(fromPath, toPath);
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
};

void main();
