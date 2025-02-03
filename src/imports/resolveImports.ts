import { Parser } from "../grammar";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { throwCompilationError } from "../error/errors";
import { resolveLibrary } from "./resolveLibrary";
import { SourceAbsolute } from "./source";

export function resolveImports(args: {
    entrypoint: string;
    project: VirtualFileSystem;
    stdlib: VirtualFileSystem;
    parser: Parser;
}) {
    const stdlibTactPath = args.stdlib.resolve("std/stdlib.tact");
    if (!args.stdlib.exists(stdlibTactPath)) {
        throwCompilationError(
            `Could not find stdlib.tact at ${stdlibTactPath}`,
        );
    }
    const stdlibTact = args.stdlib.readFile(stdlibTactPath).toString();

    const codePath = args.project.resolve(args.entrypoint);
    if (!args.project.exists(codePath)) {
        throwCompilationError(`Could not find entrypoint ${args.entrypoint}`);
    }
    const code = args.project.readFile(codePath).toString();

    //
    // Resolve all imports
    //

    const importedTact: SourceAbsolute[] = [];
    const importedFunc: SourceAbsolute[] = [];
    const processed: Set<string> = new Set();
    const pending: SourceAbsolute[] = [];
    function processImports(source: SourceAbsolute) {
        const imp = args.parser.parseImports(source);
        for (const i of imp) {
            const importPath = i.path.value;
            // Resolve library
            const resolved = resolveLibrary({
                path: source.path,
                name: importPath,
                project: args.project,
                stdlib: args.stdlib,
            });
            if (!resolved.ok) {
                throwCompilationError(
                    `Could not resolve import "${importPath}" in ${source.path}`,
                );
            }

            // Check if already imported
            if (resolved.kind === "func") {
                if (importedFunc.find((v) => v.path === resolved.path)) {
                    continue;
                }
            } else {
                if (importedTact.find((v) => v.path === resolved.path)) {
                    continue;
                }
            }

            // Load code
            const vfs =
                resolved.source === "project" ? args.project : args.stdlib;
            if (!vfs.exists(resolved.path)) {
                throwCompilationError(
                    `Could not find source file ${resolved.path}`,
                );
            }
            const code: string = vfs.readFile(resolved.path).toString();

            // Add to imports
            if (resolved.kind === "func") {
                importedFunc.push({
                    code,
                    path: resolved.path,
                    origin: source.origin,
                });
            } else {
                if (!processed.has(resolved.path)) {
                    processed.add(resolved.path);
                    pending.push({
                        path: resolved.path,
                        code,
                        origin: source.origin,
                    });
                }
            }
        }
    }

    // Run resolve
    importedTact.push({
        code: stdlibTact,
        path: stdlibTactPath,
        origin: "stdlib",
    });
    processImports({
        code: stdlibTact,
        path: stdlibTactPath,
        origin: "stdlib",
    });
    processImports({
        code,
        path: codePath,
        origin: "user",
    });
    while (pending.length > 0) {
        const p = pending.shift()!;
        importedTact.push(p);
        processImports(p);
    }
    importedTact.push({ code: code, path: codePath, origin: "user" }); // To keep order same as before refactoring

    // Assemble result
    return {
        tact: [...importedTact],
        func: [...importedFunc],
    };
}
