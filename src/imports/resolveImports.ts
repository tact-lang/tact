import type { Parser } from "../grammar";
import type { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { throwCompilationError } from "../error/errors";
import { resolveLibrary } from "./resolveLibrary";
import type { Language, Source } from "./source";

type ResolveImportsArgs = {
    readonly entrypoint: string;
    readonly project: VirtualFileSystem;
    readonly stdlib: VirtualFileSystem;
    readonly parser: Parser;
};

export function resolveImports({
    entrypoint,
    parser,
    project,
    stdlib,
}: ResolveImportsArgs) {
    const imported: Record<Language, Map<string, Source>> = {
        func: new Map(),
        tact: new Map(),
    };
    const processed: Set<string> = new Set();
    const pending: Source[] = [];
    function processImports(sourceFrom: Source) {
        const imp = parser.parseImports(sourceFrom);
        for (const { importPath, loc } of imp) {
            // Resolve library
            const resolved = resolveLibrary({
                sourceFrom,
                importPath,
                project: project,
                stdlib: stdlib,
            });
            if (!resolved.ok) {
                throwCompilationError(
                    `Could not resolve import in ${sourceFrom.path}`,
                    loc,
                );
            }

            // Check if already imported
            if (imported[resolved.language].has(resolved.path)) {
                continue;
            }

            // Load code
            const vfs = resolved.origin === "user" ? project : stdlib;
            if (!vfs.exists(resolved.path)) {
                throwCompilationError(
                    `Could not find source file ${resolved.path}`,
                );
            }
            const code: string = vfs.readFile(resolved.path).toString();

            // Add to imports
            if (resolved.language === "func") {
                imported.func.set(resolved.path, {
                    code,
                    path: resolved.path,
                    origin: resolved.origin,
                });
            } else {
                if (!processed.has(resolved.path)) {
                    processed.add(resolved.path);
                    pending.push({
                        path: resolved.path,
                        code,
                        origin: resolved.origin,
                    });
                }
            }
        }
    }

    const stdlibTactPath = stdlib.resolve("std/stdlib.tact");
    if (!stdlib.exists(stdlibTactPath)) {
        throwCompilationError(
            `Could not find stdlib.tact at ${stdlibTactPath}`,
        );
    }
    const stdlibSource: Source = {
        code: stdlib.readFile(stdlibTactPath).toString(),
        path: stdlibTactPath,
        origin: "stdlib",
    };
    imported.tact.set(stdlibTactPath, stdlibSource);
    processImports(stdlibSource);

    const codePath = project.resolve(entrypoint);
    if (!project.exists(codePath)) {
        throwCompilationError(`Could not find entrypoint ${entrypoint}`);
    }
    const entrySource: Source = {
        code: project.readFile(codePath).toString(),
        path: codePath,
        origin: "user",
    };
    processImports(entrySource);

    while (pending.length > 0) {
        const p = pending.shift()!;
        imported.tact.set(p.path, p);
        processImports(p);
    }

    imported.tact.set(codePath, entrySource);

    return {
        tact: [...imported.tact.values()],
        func: [...imported.func.values()],
    };
}
