import { parse } from "@/next/grammar";
import { emptyPath, fromString } from "@/imports/path";
import { parentPath, createMemoryFs, createProxyFs } from "@/next/fs";
import { getFiles } from "@/next/stdlib";
import type { Cursor } from "@/next/fs";
import type { Logger, SourceLogger } from "@/error/logger-util";
import type { FuncImport, ResolvedImport, Source } from "@/next/imports/source";
import type { ImportPath, ModuleItem } from "@/next/ast";
import type { Language, Range } from "@/next/ast/common";
import { throwInternal } from "@/error/errors";

type Options = {
    readonly log: Logger<string, void>;
    /**
     * Cursor to root of file system with project files
     */
    readonly project: Cursor;
    /**
     * Cursor to root of stdlib file system
     */
    readonly stdlib: Cursor;
    /**
     * Implicit imports (without `import "..."`) to add
     * into every source
     */
    readonly implicits: readonly ResolvedImport[];
    /**
     * Name of root source file of the project
     */
    readonly rootPath: ImportPath;
};

type DepId = string;
type RawTactSource = {
    readonly code: string;
    readonly imports: readonly RawImport[];
    readonly items: readonly ModuleItem[];
};
type RawFuncSource = {
    readonly code: string;
    readonly imports: readonly RawFuncImport[];
}

type RawImport = RawTactImport | RawFuncImport;
type RawTactImport = {
    readonly language: "tact";
    readonly depId: DepId;
    readonly loc: Range;
};
type RawFuncImport = {
    readonly language: "func";
    readonly depId: DepId;
    readonly loc: Range;
};

const readSource = async ({
    log,
    project,
    stdlib,
    implicits,
    rootPath,
}: Options) => {
    const status: Map<DepId, 'pending' | 'errored' | 'done'> = new Map();
    const tactRaw: Map<DepId, RawTactSource> = new Map();
    const funcRaw: Map<DepId, RawFuncSource> = new Map();

    const resolveTactImports = async (
        log: SourceLogger<string, void>,
        dir: Cursor,
        code: string,
    ): Promise<RawTactSource> => {
        const { imports: rawImports, items } = parse(log, code);
        const imports: RawImport[] = [];
        for (const { importPath: { language, path, type }, loc } of rawImports) {
            imports.push({
                language,
                depId: await resolveSource(
                    type === "relative"
                        ? dir.focus(path)
                        : stdlib.focus(path),
                    language,
                ),
                loc,
            });
        }
        return { code, imports, items };
    };

    const resolveFuncImports = async (
        _log: SourceLogger<string, void>,
        _file: Cursor,
        code: string,
        // eslint-disable-next-line @typescript-eslint/require-await
    ): Promise<RawFuncSource> => {
        // TODO: resolve imports
        return { code, imports: [] };
    };

    const resolveSource = async (file: Cursor, language: Language): Promise<DepId> => {
        const path = file.getAbsolutePathForLog();
        // this file is already currently being resolved
        if (status.has(path)) {
            return path;
        }
        status.set(path, 'pending');
        const code = await file.read();
        if (!code) {
            status.set(path, 'errored');
            return path;
        }
        const dir = file.focus(parentPath);
        await log.source(path, code, async (log) => {
            if (language === 'tact') {
                tactRaw.set(path, await resolveTactImports(log, dir, code));
            } else {
                funcRaw.set(path, await resolveFuncImports(log, dir, code));
            }
        });
        status.set(path, 'done');
        return path;
    };

    if (rootPath.type !== 'relative') {
        log.error(log.text`Cannot build standard library as root`);
        return undefined;
    }
    if (rootPath.language !== 'tact') {
        log.error(log.text`Use ${rootPath.language} compiler`);
        return undefined;
    }

    const rootDepId = await resolveSource(project.focus(rootPath.path), rootPath.language);

    if ([...status.values()].includes("errored")) {
        return undefined;
    }

    const func: Map<DepId, {
        readonly kind: 'func';
        readonly code: string;
        /* mutable */ imports: readonly FuncImport[];
    }> = new Map();
    for (const [key, { code }] of funcRaw) {
        func.set(key, {
            kind: 'func',
            code,
            imports: [],
        });
    }
    for (const [key, { imports }] of funcRaw) {
        const entry = func.get(key);
        if (!entry) {
            return throwInternal("Impossible");
        }
        entry.imports = imports.map(({ depId, language, loc }): FuncImport => {
            const source = func.get(depId);
            if (!source) {
                return throwInternal("Impossible");
            }
            return { kind: language, source, loc };
        });
    }

    const tact: Map<DepId, {
        readonly kind: 'tact';
        readonly code: string;
        /* mutable */ imports: readonly ResolvedImport[];
        readonly items: readonly ModuleItem[];
    }> = new Map();
    for (const [key, { code, items }] of tactRaw) {
        tact.set(key, {
            kind: 'tact',
            code,
            imports: [],
            items,
        });
    }
    for (const [key, { imports }] of tactRaw) {
        const entry = tact.get(key);
        if (!entry) {
            return throwInternal("Impossible");
        }
        entry.imports = [
            ...implicits,
            ...imports.map((i): ResolvedImport => {
                if (i.language === 'func') {
                    const source = func.get(i.depId);
                    if (!source) {
                        return throwInternal("Impossible");
                    }
                    return { kind: 'func', source, loc: i.loc };
                } else {
                    const source = tact.get(i.depId);
                    if (!source) {
                        return throwInternal("Impossible");
                    }
                    return { kind: 'tact', source, loc: i.loc };
                }
            }),
        ];
    }

    const sources: Source[] = [...func.values(), ...tact.values()];
    const root = tact.get(rootDepId);

    if (!root) {
        return undefined;
    }

    return { sources, root };
};

/**
 * Read standard library and prepare for reading projects
 */
export const ProjectReader = async (log: Logger<string, void>) => {
    const stdRoot = createMemoryFs({
        log,
        files: getFiles(),
        root: emptyPath,
        isReadonly: true,
    });
    const stdLibs = stdRoot.focus(fromString("libs"));
    const stdStd = await readSource({
        log,
        project: stdRoot,
        stdlib: stdLibs,
        implicits: [],
        rootPath: {
            type: 'relative',
            language: 'tact',
            path: fromString("std/stdlib.tact"),
        },
    });
    if (!stdStd) {
        // Could not load standard library
        // No compilation is possible
        return;
    }

    /**
     * Read project
     */
    const read = async (fsRootPath: string, rootPath: ImportPath) => {
        const project = createProxyFs({
            log,
            root: fsRootPath,
            isReadonly: false,
        });
        const implicits: ResolvedImport[] = [
            {
                kind: "tact",
                source: stdStd.root,
                loc: { start: 0, end: 0 },
            },
        ];
        const result = await readSource({
            log,
            project,
            stdlib: stdLibs,
            implicits,
            rootPath,
        });
        if (!result) {
            return undefined;
        }

        return {
            root: result.root,
            sources: [...stdStd.sources, ...result.sources],
        };
    };

    return { read };
};
