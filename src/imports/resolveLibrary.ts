import { ImportPath } from "../ast/ast";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { asString } from "./path";
import { ItemOrigin, Language, Source } from "./source";

type ResolveLibraryArgs = {
    readonly importPath: ImportPath;
    readonly sourceFrom: Source;
    readonly project: VirtualFileSystem;
    readonly stdlib: VirtualFileSystem;
};

type ResolveLibrarySuccess = {
    readonly ok: true;
    readonly path: string;
    readonly language: Language;
    readonly origin: ItemOrigin;
};

type ResolveLibraryFailure = {
    ok: false;
};

type ResolveLibraryResult = ResolveLibrarySuccess | ResolveLibraryFailure;

export function resolveLibrary({
    importPath,
    sourceFrom,
    project,
    stdlib,
}: ResolveLibraryArgs): ResolveLibraryResult {
    if (importPath.type === "stdlib") {
        const tactFile = stdlib.resolve("libs", asString(importPath.path));

        if (stdlib.exists(tactFile)) {
            return {
                ok: true,
                path: tactFile,
                origin: "stdlib",
                language: "tact",
            };
        } else {
            return { ok: false };
        }
    } else {
        const vfs = sourceFrom.origin === "stdlib" ? stdlib : project;
        const resolvedPath = vfs.resolve(
            sourceFrom.path.slice(vfs.root.length),
            "..",
            asString(importPath.path),
        );

        if (vfs.exists(resolvedPath)) {
            return {
                ok: true,
                path: resolvedPath,
                origin: sourceFrom.origin,
                language: importPath.language,
            };
        } else {
            return { ok: false };
        }
    }
}
