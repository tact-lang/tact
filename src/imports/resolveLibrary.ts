import { SourceReference } from "../ast/ast";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { asString } from "./path";
import { ItemOrigin, Language, Source } from "./source";

type ResolveLibraryArgs = {
    sourceRef: SourceReference;
    sourceFrom: Source;
    project: VirtualFileSystem;
    stdlib: VirtualFileSystem;
};

type ResolveLibraryResult =
    | {
          ok: true;
          path: string;
          language: Language;
          origin: ItemOrigin;
      }
    | {
          ok: false;
      };

export function resolveLibrary({
    sourceRef: sourceRef,
    sourceFrom,
    project,
    stdlib,
}: ResolveLibraryArgs): ResolveLibraryResult {
    if (sourceRef.type === "stdlib") {
        const tactFile = stdlib.resolve("libs", asString(sourceRef.path));

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
            asString(sourceRef.path),
        );

        if (vfs.exists(resolvedPath)) {
            return {
                ok: true,
                path: resolvedPath,
                origin: sourceFrom.origin,
                language: sourceRef.language,
            };
        } else {
            return { ok: false };
        }
    }
}
