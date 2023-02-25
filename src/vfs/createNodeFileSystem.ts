import { VirtualFileSystem } from "./VirtualFileSystem";
import fs from 'fs';
import path from "path";
import mkdirp from "mkdirp";

export function createNodeFileSystem(root: string, readonly: boolean = true): VirtualFileSystem {
    let normalizedRoot = path.normalize(root);
    return {
        root: normalizedRoot,
        exits(filePath: string): boolean {
            if (!filePath.startsWith(normalizedRoot)) {
                throw new Error('Path is outside of the root directory');
            }
            return fs.existsSync(filePath);
        },
        resolve(...filePath) {
            return path.normalize(path.resolve(normalizedRoot, ...filePath));
        },
        readFile(filePath) {
            if (!filePath.startsWith(normalizedRoot)) {
                throw new Error('Path is outside of the root directory');
            }
            return fs.readFileSync(filePath);
        },
        writeFile(filePath, content) {
            if (readonly) {
                throw new Error('File system is readonly');
            }
            if (!filePath.startsWith(normalizedRoot)) {
                throw new Error('Path is outside of the root directory');
            }

            mkdirp.sync(path.dirname(filePath));
            fs.writeFileSync(filePath, content);
        }
    }
}