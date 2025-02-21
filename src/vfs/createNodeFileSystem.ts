import type { VirtualFileSystem } from "./VirtualFileSystem";
import fs from "fs";
import path from "path";

function ensureInsideProjectRoot(filePath: string, root: string): void {
    if (!filePath.startsWith(root)) {
        throw new Error(
            `Path "${filePath} is outside of the root directory "${root}"`,
        );
    }
}
function ensureNotSymlink(filePath: string): void {
    if (fs.lstatSync(filePath).isSymbolicLink()) {
        throw new Error(
            `Path "${filePath}" is a symbolic link which are not processed by Tact to forbid out-of-project-root accesses via symlinks`,
        );
    }
}

export function createNodeFileSystem(
    root: string,
    readonly: boolean = true,
): VirtualFileSystem {
    let normalizedRoot = path.normalize(root);
    if (!normalizedRoot.endsWith(path.sep)) {
        normalizedRoot += path.sep;
    }
    return {
        root: normalizedRoot,
        exists(filePath: string): boolean {
            ensureInsideProjectRoot(filePath, normalizedRoot);
            const result = fs.existsSync(filePath);
            if (result) {
                ensureNotSymlink(filePath);
            }
            return result;
        },
        resolve(...filePath) {
            return path.normalize(path.resolve(normalizedRoot, ...filePath));
        },
        readFile(filePath) {
            ensureInsideProjectRoot(filePath, normalizedRoot);
            ensureNotSymlink(filePath);
            return fs.readFileSync(filePath);
        },
        writeFile(filePath, content) {
            if (readonly) {
                throw new Error("File system is readonly");
            }
            ensureInsideProjectRoot(filePath, normalizedRoot);
            if (fs.existsSync(filePath)) {
                ensureNotSymlink(filePath);
            }
            fs.mkdirSync(path.dirname(filePath), { recursive: true });
            fs.writeFileSync(filePath, content);
        },
    };
}
