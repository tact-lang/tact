import type * as Ast from "@/ast/ast";
import type { VirtualFileSystem } from "@/vfs/VirtualFileSystem";
import { asString } from "@/imports/path";
import type { ItemOrigin, Language, Source } from "@/imports/source";
import { repeat } from "@/utils/array";

type ResolveLibraryArgs = {
    readonly importPath: Ast.ImportPath;
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

const nodeModulesPath = "node_modules";

const findIndentNodeModules = (
    project: VirtualFileSystem,
    root: string,
    path: string,
) => {
    // TODO: unwind folders until we either
    // find our import or reach project root
    for (let index = 0; index < 20; index++) {
        const tryRes = project.resolve(
            root,
            ...repeat("..", index),
            nodeModulesPath,
            path,
        );

        if (!project.exists(tryRes)) {
            continue;
        }

        return {
            ok: true,
            path: tryRes,
        };
    }

    return {
        ok: false,
    };
};

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
    } else if (importPath.type === "package") {
        const res = findIndentNodeModules(
            project,
            sourceFrom.path.slice(project.root.length),
            asString(importPath.path),
        );

        if (res.ok) {
            return {
                ok: true,
                path: res.path!,
                origin: sourceFrom.origin,
                language: importPath.language,
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
