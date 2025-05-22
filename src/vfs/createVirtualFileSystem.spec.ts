import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";

describe("createVirtualFileSystem", () => {
    it("should create a virtual file system", () => {
        let vfs = createVirtualFileSystem("/", {});
        expect(vfs.root).toBe("/");
        vfs = createVirtualFileSystem("//", {});
        expect(vfs.root).toBe("/");
        vfs = createVirtualFileSystem("//./", {});
        expect(vfs.root).toBe("/");
        vfs = createVirtualFileSystem("@stdlib", {});
        expect(vfs.root).toBe("@stdlib/");
    });

    it("should read from virtual file system", () => {
        const fs: Record<string, string> = {
            ["file.txt"]: Buffer.from("Hello World").toString("base64"),
            ["empty.txt"]: Buffer.from([]).toString("base64"),
        };
        const vfs = createVirtualFileSystem("@stdlib", fs);
        let realPath = vfs.resolve("./", "./", "file.txt");
        expect(realPath).toBe("@stdlib/file.txt");
        expect(vfs.exists(realPath)).toBe(true);
        expect(vfs.readFile(realPath).toString()).toBe("Hello World");
        realPath = vfs.resolve("./", "./", "empty.txt");
        expect(realPath).toBe("@stdlib/empty.txt");
        expect(vfs.exists(realPath)).toBe(true);
        expect(vfs.readFile(realPath).toString()).toBe("");
    });

    it("should truncate and hash long filenames", () => {
        const fs: Record<string, string> = {};
        const vfs = createVirtualFileSystem("@vroot", fs, false);

        const longName = "A".repeat(300);
        const content = "Test content";
        const ext = ".md";

        const inputPath = vfs.resolve("./", `${longName}${ext}`);

        vfs.writeFile(inputPath, content);

        const storedPaths = Object.keys(fs);
        expect(storedPaths.length).toBe(1);

        const storedPath = storedPaths[0]!;
        expect(storedPath).toBeDefined();
        expect(storedPath.length).toBeLessThanOrEqual(255);

        const regex = new RegExp(
            `^${longName.slice(0, 255 - ext.length - 9)}_[0-9a-f]{8}${ext}$`,
        );
        expect(storedPath).toMatch(regex);

        expect(fs[storedPath]).toBe(Buffer.from(content).toString("base64"));
    });

    it("should not truncate or hash short filenames", () => {
        const fs: Record<string, string> = {};
        const vfs = createVirtualFileSystem("@vroot", fs, false);

        const shortName = "short-filename";
        const content = "Test content";
        const ext = ".md";

        const inputPath = vfs.resolve("./", `${shortName}${ext}`);

        vfs.writeFile(inputPath, content);

        const storedPaths = Object.keys(fs);
        expect(storedPaths.length).toBe(1);

        const storedPath = storedPaths[0]!;
        expect(storedPath).toBeDefined();

        expect(storedPath).toBe(`${shortName}${ext}`);
        expect(fs[storedPath]).toBe(Buffer.from(content).toString("base64"));
    });

});
