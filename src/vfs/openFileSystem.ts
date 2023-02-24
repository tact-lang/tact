import path from 'path';
import fs from 'fs';
import mkdirp from 'mkdirp';
import pathNormalize from 'path-normalize';
import { VirtualFileSystem } from './VirtualFileSystem';

export function openFileSystem(root: string): VirtualFileSystem {
    let rootNormalized = pathNormalize(root);
    return {
        resolve(...pathSegments: string[]): string {
            return pathNormalize(path.resolve(rootNormalized, ...pathSegments));
        },
        readFile(filePath) {
            if (fs.existsSync(filePath)) {
                return fs.readFileSync(filePath);
            } else {
                return null;
            }
        },
        writeFile(filePath, data) {
            
            // Crete dirs if needed
            mkdirp.sync(path.dirname(filePath));

            // Write file
            fs.writeFileSync(filePath, data);
        },
    }
}