import fs from "fs";
import { readFile, writeFile } from "fs/promises";
import { basename, dirname, extname, join } from "path";
import { runTest } from "@/next/test/_test.build";

const root = __dirname;

const listCases = (): readonly string[] => {
    return fs
        .readdirSync(root)
        .filter((file) => file.endsWith(".tact"))
        .map((file) => join(root, file));
};

const readFileOpt = async (path: string): Promise<string | undefined> => {
    try {
        return await readFile(path, "utf8");
    } catch (err) {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        if (err && (err as any).code === "ENOENT") return undefined;
        throw err;
    }
};

it.each(listCases())("%s", async (path) => {
    const newText = await runTest(path);
    const snapPath = join(
        dirname(path),
        basename(path, extname(path)) + ".snap.js",
    );
    const isUpdate = expect.getState().snapshotState._updateSnapshot === "all";
    const oldText = await readFileOpt(snapPath);
    if (isUpdate || typeof oldText === "undefined") {
        await writeFile(snapPath, newText, "utf-8");
        expect(newText).toBe(newText);
    } else {
        expect(newText).toBe(oldText);
    }
});
