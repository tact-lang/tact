import { ItemOrigin } from "../grammar";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { throwCompilationError } from "../error/errors";
import { resolveLibrary } from "./resolveLibrary";
import { Stdlib } from "../pipeline/fs";
import { AstImport } from "../ast/ast";

const createQueue = <K, V>() => {
    const processed: Set<K> = new Set();
    const queue: { key: K, value: V }[] = [];

    const add = (key: K, value: V) => {
        if (!processed.has(key)) {
            processed.add(key);
            queue.push({ key, value });
        }
    };

    const iterate = (f: (key: K, value: V) => void) => {
        for (;;) {
            const pair = queue.shift();
            if (typeof pair === 'undefined') {
                return;
            }
            const { key, value } = pair;
            f(key, value);
        }
    };

    return {
        add,
        iterate,
    }
};

export type Source = {
    readonly code: string;
    readonly origin: ItemOrigin;
}

export type Imports = {
    readonly tact: Record<string, Source>,
    readonly func: Record<string, Source>
}

export const resolveImports = ({
    parseImports,
    stdlib,
    entrypoint,
    projectFs,
    stdlibFs,
}: {
    parseImports: (src: string, path: string, origin: ItemOrigin) => AstImport[]
    stdlib: Stdlib;
    projectFs: VirtualFileSystem;
    stdlibFs: VirtualFileSystem;
    entrypoint: string
}): Imports => {
    const q = createQueue<string, Source>();

    q.add(stdlib.stdlibTactPath, { code: stdlib.stdlibTact, origin: "stdlib" });

    const codePath = projectFs.resolve(entrypoint);
    const code = projectFs.readFile(codePath).toString();
    q.add(codePath, { code: code, origin: "user" });

    const result: Imports = { func: {}, tact: {} };
    q.iterate((path, { code, origin }) => {
        result.tact[path] = { code, origin };
        
        for (const { path: { value: importPath } } of parseImports(code, path, origin)) {
            const resolved = resolveLibrary({
                path: path,
                name: importPath,
                project: projectFs,
                stdlib: stdlibFs,
            });

            if (!resolved.ok) {
                throwCompilationError(
                    `Could not resolve import "${importPath}" in ${path}`,
                );
            }

            if (resolved.path in result[resolved.kind]) {
                continue;
            }

            const newFile: Source = {
                origin: resolved.source === 'project' ? 'user' : 'stdlib',
                code: (resolved.source === "project" ? projectFs : stdlibFs).readFile(resolved.path).toString(),
            };

            if (resolved.kind === "func") {
                result.func[resolved.path] = newFile;
            } else {
                q.add(resolved.path, newFile);
            }
        }
    });

    return result;
}
