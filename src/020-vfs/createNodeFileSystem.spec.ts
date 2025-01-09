import path from "path";
import fs from "fs";
import rimraf from "rimraf";
import { createNodeFileSystem } from "./createNodeFileSystem";

describe("createNodeFileSystem", () => {
    it("should open file system", () => {
        const vfs = createNodeFileSystem(
            path.resolve(__dirname, "./__testdata/"),
        );
        expect(vfs.root).toBe(path.normalize(__dirname + "/__testdata/"));
    });

    it("should write and read files", () => {
        const vfs = createNodeFileSystem(
            path.resolve(__dirname, "./__testdata"),
            false,
        );

        // Create a single file
        const filename = "tmp-" + Math.random() + ".txt";
        const realPath = vfs.resolve(filename);
        try {
            expect(vfs.exists(realPath)).toBe(false);
            vfs.writeFile(realPath, "Hello world");
            expect(vfs.exists(realPath)).toBe(true);
            expect(vfs.readFile(realPath).toString("utf8")).toBe("Hello world");
            expect(fs.readFileSync(realPath, "utf8")).toBe("Hello world");
        } finally {
            fs.unlinkSync(realPath);
        }

        // Automatically create directories
        const dir = "dir-" + Math.random();
        const fileName2 = dir + "/" + Math.random() + ".txt";
        const realPath2 = vfs.resolve(fileName2);
        const realPathDir2 = vfs.resolve(dir);
        try {
            expect(vfs.exists(realPath2)).toBe(false);
            vfs.writeFile(realPath2, "Hello world");
            expect(vfs.exists(realPath2)).toBe(true);
            expect(vfs.readFile(realPath2).toString("utf8")).toBe(
                "Hello world",
            );
            expect(fs.readFileSync(realPath2, "utf8")).toBe("Hello world");
        } finally {
            rimraf.sync(realPathDir2);
        }
    });
});
