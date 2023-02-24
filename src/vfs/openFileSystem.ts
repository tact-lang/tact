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
        exists(filePath) {
            return fs.existsSync(filePath);
        },
        readFile(filePath) {
            return fs.readFileSync(filePath);
        },
        writeFile(filePath, data) {
            
            // Crete dirs if needed
            mkdirp.sync(path.dirname(filePath));

            // Write file
            fs.writeFileSync(filePath, data);
        },
    }
}