import { createVirtualFileSystem } from "./createVirtualFileSystem";

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
        const fs: { [key: string]: string } = {
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
});
