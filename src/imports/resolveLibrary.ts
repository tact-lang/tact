import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { parseImportPath } from "./parseImportPath";

export type ResolveLibraryArgs = {
    path: string;
    name: string;
    project: VirtualFileSystem;
    stdlib: VirtualFileSystem;
};

export type ResolveLibraryResult =
    | {
          ok: true;
          path: string;
          kind: "func" | "tact";
          source: "project" | "stdlib";
      }
    | {
          ok: false;
      };

export function resolveLibrary(args: ResolveLibraryArgs): ResolveLibraryResult {
    // Stdlib resolving
    // NOTE: We are handling stdlib resolving here, because we need to enforce the stdlib import before anything else
    //       to avoid hijacking the stdlib imports
    if (args.name.startsWith("@stdlib/")) {
        const libraryName = args.name.substring("@stdlib/".length);
        const libraryPath = parseImportPath("./" + libraryName + ".tact");
        if (!libraryPath) {
            return { ok: false };
        }
        const tactFile = args.stdlib.resolve("libs", ...libraryPath);
        if (args.stdlib.exists(tactFile)) {
            return { ok: true, path: tactFile, source: "stdlib", kind: "tact" };
        } else {
            return { ok: false };
        }
    }

    // Resolve vfs
    let vfs: VirtualFileSystem;
    let source: "project" | "stdlib";
    if (args.path.startsWith(args.stdlib.root)) {
        // NOTE: stdlib checked first to avoid hijacking stdlib imports
        vfs = args.stdlib;
        source = "stdlib";
    } else if (args.path.startsWith(args.project.root)) {
        vfs = args.project;
        source = "project";
    } else {
        return { ok: false };
    }
    const workingDirectory = args.path.slice(vfs.root.length);

    // Resolving relative file
    let importName = args.name;
    const kind: "tact" | "func" = importName.endsWith(".fc") ? "func" : "tact";
    if (!importName.endsWith(".tact") && !importName.endsWith(".fc")) {
        importName = importName + ".tact";
    }

    // Resolve import
    const parsedImport = parseImportPath(importName);
    if (!parsedImport) {
        return { ok: false };
    }
    const resolvedPath = vfs.resolve(workingDirectory, "..", ...parsedImport);
    if (vfs.exists(resolvedPath)) {
        return { ok: true, path: resolvedPath, source, kind };
    }

    // Nothing matched
    return { ok: false };
}
