import normalize from "path-normalize";
import { VirtualFileSystem } from "./VirtualFileSystem";

export function openReadOnlyVirtualFileSystem(root: string, files: { [key: string]: string }): VirtualFileSystem {
    return {
        resolve(...pathSegments: string[]): string {
            return root + '/' + normalize(pathSegments.join('/'));
        },
        exists(filePath) {
            if (!filePath.startsWith(root + '/')) {
                return false;
            }
            return files.hasOwnProperty(filePath.slice(root.length + 1));
        },
        readFile(filePath) {
            if (!filePath.startsWith(root + '/')) {
                throw Error('Cannot read file outside of root');
            }
            if (!files.hasOwnProperty(filePath.slice(root.length + 1))) {
                throw Error('File does not exist');
            }
            return Buffer.from(files[filePath.slice(root.length + 1)], 'base64');
        },
        writeFile(filePath, data) {
            throw Error('Cannot write to read-only file system');
        }
    }
}