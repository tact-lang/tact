import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { parseImportPath } from "./parseImportPath";

export type ResolveLibraryArgs = {
    path: string,
    name: string,
    project: VirtualFileSystem,
    stdlib: VirtualFileSystem,
    npm: VirtualFileSystem
};

export type ResolveLibraryResult = {
    ok: true,
    path: string;
    kind: 'func' | 'tact';
    source: 'project' | 'stdlib' | 'npm';
} | {
    ok: false
}

export function resolveLibrary(args: ResolveLibraryArgs): ResolveLibraryResult {

    // Stdlib resolving
    // NOTE: We are handling stdlib resolving here, because we need to enforce the stdlib import before anything else
    //       to avoid hijacking the stdlib imports
    if (args.name.startsWith('@stdlib/')) {
        let libraryName = args.name.substring('@stdlib/'.length);
        let libraryPath = parseImportPath('./' + libraryName + '.tact');
        if (!libraryPath) {
            return { ok: false };
        }
        let tactFile = args.stdlib.resolve('libs', ...libraryPath);
        if (args.stdlib.exists(tactFile)) {
            return { ok: true, path: tactFile, source: 'stdlib', kind: 'tact' };
        } else {
            return { ok: false };
        }
    }

    if (args.name.startsWith('@npm/')) {
        let libraryName = args.name.substring('@npm/'.length);
        let libraryPath = parseImportPath('./' + libraryName + '.tact');
        if (!libraryPath) {
            return { ok: false };
        }
        let tactFile = args.npm.resolve(...libraryPath);
        if (args.npm.exists(tactFile)) {
            return { ok: true, path: tactFile, source: 'npm', kind: 'tact' };
        } else {
            return { ok: false };
        }
    }

    // Resolve vfs
    let vfs: VirtualFileSystem;
    let source: 'project' | 'stdlib' | 'npm';
    if (args.path.startsWith(args.stdlib.root)) { // NOTE: stdlib checked first to avoid hijacking stdlib imports
        vfs = args.stdlib;
        source = 'stdlib';
    } else if (args.path.startsWith(args.npm.root)) {
        vfs = args.npm;
        source = 'npm';
    } else if (args.path.startsWith(args.project.root)) {
        vfs = args.project;
        source = 'project';
    } else {
        return { ok: false };
    }
    let workingDirectory = args.path.slice(vfs.root.length);

    // Resolving relative file
    let importName = args.name;
    let kind: 'tact' | 'func' = importName.endsWith('.fc') ? 'func' : 'tact';
    if (!importName.endsWith('.tact') && !importName.endsWith('.fc')) {
        importName = importName + '.tact';
    }

    // Resolve import
    let parsedImport = parseImportPath(importName);
    if (!parsedImport) {
        return { ok: false };
    }
    let resolvedPath = vfs.resolve(workingDirectory, '..', ...parsedImport);
    if (vfs.exists(resolvedPath)) {
        return { ok: true, path: resolvedPath, source, kind };
    }

    // Nothing matched
    return { ok: false };
}