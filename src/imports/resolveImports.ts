import { ItemOrigin, Parser } from "../grammar";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { throwCompilationError } from "../error/errors";
import { resolveLibrary } from "./resolveLibrary";

export function resolveImports(args: {
    entrypoint: string;
    project: VirtualFileSystem;
    stdlib: VirtualFileSystem;
    parser: Parser;
}) {
    //
    // Load stdlib and entrypoint
    //

    // const stdlibFuncPath = args.stdlib.resolve('./stdlib.fc');
    // const stdlibFunc = args.stdlib.readFile(stdlibFuncPath).toString();

    const stdlibTactPath = args.stdlib.resolve("stdlib.tact");
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

    const importedTact: { code: string; path: string; origin: ItemOrigin }[] =
        [];
    const importedFunc: { code: string; path: string; origin: ItemOrigin }[] =
        [];
    const processed: Set<string> = new Set();
    const pending: { code: string; path: string; origin: ItemOrigin }[] = [];
    function processImports(source: string, path: string, origin: ItemOrigin) {
        const imp = args.parser.parseImports(source, path, origin);
        for (const i of imp) {
            const importPath = i.path.value;
            // Resolve library
            const resolved = resolveLibrary({
                path: path,
                name: importPath,
                project: args.project,
                stdlib: args.stdlib,
            });
            if (!resolved.ok) {
                throwCompilationError(
                    `Could not resolve import "${importPath}" in ${path}`,
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
                importedFunc.push({ code, path: resolved.path, origin });
            } else {
                if (!processed.has(resolved.path)) {
                    processed.add(resolved.path);
                    pending.push({ path: resolved.path, code, origin });
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
    processImports(stdlibTact, stdlibTactPath, "stdlib");
    processImports(code, codePath, "user");
    while (pending.length > 0) {
        const p = pending.shift()!;
        importedTact.push(p);
        processImports(p.code, p.path, p.origin);
    }
    importedTact.push({ code: code, path: codePath, origin: "user" }); // To keep order same as before refactoring

    // Assemble result
    return {
        tact: [...importedTact],
        func: [
            // { code: stdlibFunc, path: stdlibFuncPath },
            ...importedFunc,
        ],
    };
}
