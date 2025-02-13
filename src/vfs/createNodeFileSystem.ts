import { VirtualFileSystem } from "./VirtualFileSystem";
import fs from "fs";
import path from "path";
import { throwCompilationError } from "../error/errors";

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
            if (!filePath.startsWith(normalizedRoot)) {
                throwCompilationError(
                    `Path '${filePath}' is outside of the root directory '${normalizedRoot}'`,
                );
            }
            return fs.existsSync(filePath);
        },
        resolve(...filePath) {
            return path.normalize(path.resolve(normalizedRoot, ...filePath));
        },
        readFile(filePath) {
            if (!filePath.startsWith(normalizedRoot)) {
                throwCompilationError(
                    `Path '${filePath}' is outside of the root directory '${normalizedRoot}'`,
                );
            }
            return fs.readFileSync(filePath);
        },
        writeFile(filePath, content) {
            if (readonly) {
                throwCompilationError("File system is readonly");
            }
            if (!filePath.startsWith(normalizedRoot)) {
                throwCompilationError(
                    `Path '${filePath}' is outside of the root directory '${normalizedRoot}'`,
                );
            }

            fs.mkdirSync(path.dirname(filePath), { recursive: true });
            fs.writeFileSync(filePath, content);
        },
    };
}
