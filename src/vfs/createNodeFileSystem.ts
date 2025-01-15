import { VirtualFileSystem } from "./VirtualFileSystem";
import fs from "fs";
import path from "path";
import mkdirp from "mkdirp";

export function createNodeFileSystem(
    root: string,
    readonly: boolean = true,
): VirtualFileSystem {
    if (!root.endsWith(path.sep)) {
        root += path.sep;
    }
    return {
        root: root,
        exists(filePath: string): boolean {
            if (!filePath.startsWith(root)) {
                throw new Error(
                    `Path '${filePath}' is outside of the root directory '${root}'`,
                );
            }
            return fs.existsSync(filePath);
        },
        resolve(...filePath) {
            return path.normalize(path.resolve(root, ...filePath));
        },
        readFile(filePath) {
            if (!filePath.startsWith(root)) {
                throw new Error(
                    `Path '${filePath}' is outside of the root directory '${root}'`,
                );
            }
            return fs.readFileSync(filePath);
        },
        writeFile(filePath, content) {
            if (readonly) {
                throw new Error("File system is readonly");
            }
            if (!filePath.startsWith(root)) {
                throw new Error(
                    `Path '${filePath}' is outside of the root directory '${root}'`,
                );
            }

            mkdirp.sync(path.dirname(filePath));
            fs.writeFileSync(filePath, content);
        },
    };
}
