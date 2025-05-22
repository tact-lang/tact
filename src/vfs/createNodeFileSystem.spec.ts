import path from "path";
import fs from "fs";
import { createNodeFileSystem } from "@/vfs/createNodeFileSystem";
import { makeSafeName } from "@/vfs/utils";

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
            fs.rmSync(realPathDir2, { recursive: true, force: true });
        }
    });

    it("should truncate and hash long filenames", () => {
        const baseDir = path.resolve(__dirname, "./__testdata");
        const vfs = createNodeFileSystem(baseDir, false);

        const longName = "A".repeat(300);
        const content = "Test content";
        const ext = ".md";

        const inputPath = vfs.resolve(`${longName}${ext}`);
        const dir = path.dirname(inputPath);
        const expectedSafeName = makeSafeName(longName, ext);
        const expectedFullPath = path.join(dir, expectedSafeName);

        try {
            if (fs.existsSync(expectedFullPath)) {
                fs.unlinkSync(expectedFullPath);
            }

            vfs.writeFile(inputPath, content);
            expect(fs.existsSync(expectedFullPath)).toBe(true);

            const actualContent = fs.readFileSync(expectedFullPath, "utf8");
            expect(actualContent).toBe(content);

            expect(expectedSafeName.length).toBeLessThanOrEqual(255);
            expect(expectedSafeName).toMatch(
                new RegExp(
                    `^${longName.slice(0, 255 - ext.length - 9)}_[0-9a-f]{8}${ext}$`,
                ),
            );
        } finally {
            if (fs.existsSync(expectedFullPath)) {
                fs.unlinkSync(expectedFullPath);
            }
        }
    });
    it("should not truncate or hash short filenames", () => {
        const baseDir = path.resolve(__dirname, "./__testdata");
        const vfs = createNodeFileSystem(baseDir, false);

        const shortName = "short-filename";
        const content = "Test content";
        const ext = ".md";

        const inputPath = vfs.resolve(`${shortName}${ext}`);
        const dir = path.dirname(inputPath);
        const expectedSafeName = makeSafeName(shortName, ext);
        const expectedFullPath = path.join(dir, expectedSafeName);

        try {
            if (fs.existsSync(expectedFullPath)) {
                fs.unlinkSync(expectedFullPath);
            }

            vfs.writeFile(inputPath, content);
            expect(fs.existsSync(expectedFullPath)).toBe(true);

            const actualContent = fs.readFileSync(expectedFullPath, "utf8");
            expect(actualContent).toBe(content);

            expect(expectedSafeName).toBe(`${shortName}${ext}`);
        } finally {
            if (fs.existsSync(expectedFullPath)) {
                fs.unlinkSync(expectedFullPath);
            }
        }
    });
});
