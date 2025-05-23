import normalize from "path-normalize";
import type { VirtualFileSystem } from "@/vfs/VirtualFileSystem";

export function createVirtualFileSystem(
    root: string,
    fs: Record<string, string>,
    readonly: boolean = true,
): VirtualFileSystem {
    let normalizedRoot = normalize(root);
    if (!normalizedRoot.endsWith("/")) {
        normalizedRoot += "/";
    }
    return {
        root: normalizedRoot,
        exists(filePath: string): boolean {
            if (!filePath.startsWith(normalizedRoot)) {
                throw new Error(
                    `Path '${filePath}' is outside of the root directory '${normalizedRoot}'`,
                );
            }
            const name = filePath.slice(normalizedRoot.length);
            return typeof fs[name] === "string";
        },
        resolve(...filePath): string {
            return normalize([normalizedRoot, ...filePath].join("/"));
        },
        readFile(filePath): Buffer {
            if (!filePath.startsWith(normalizedRoot)) {
                throw new Error(
                    `Path '${filePath}' is outside of the root directory '${normalizedRoot}'`,
                );
            }
            const name = filePath.slice(normalizedRoot.length);
            const content = fs[name];
            if (typeof content !== "string") {
                throw Error(`File ${name} not found at ${filePath}`);
            } else {
                return Buffer.from(content, "base64");
            }
        },
        writeFile(filePath, content): void {
            if (readonly) {
                throw new Error("File system is readonly");
            }
            if (!filePath.startsWith(normalizedRoot)) {
                throw new Error(
                    `Path '${filePath}' is outside of the root directory '${normalizedRoot}'`,
                );
            }
            const name = filePath.slice(normalizedRoot.length);
            fs[name] =
                typeof content === "string"
                    ? Buffer.from(content).toString("base64")
                    : content.toString("base64");
        },
    };
}
