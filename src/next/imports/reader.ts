import { parse } from "@/next/grammar";
import { emptyPath, fromString } from "@/imports/path";
import { parentPath, createMemoryFs, createProxyFs } from "@/next/fs";
import { getFiles } from "@/next/stdlib";
import type { Cursor } from "@/next/fs";
import type { AnyLogger, Logger, SourceLogger } from "@/error/logger-util";
import type {
    FuncImport,
    Implicit,
    ResolvedImport,
    TactImport,
    TactSource,
} from "@/next/imports/source";
import type { ModuleItems, Loc } from "@/next/ast";
import { hideProperty } from "@/utils/tricks";

type Options<M> = {
    readonly log: Logger<M, void>;
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
    readonly root: string;
};

export const readSource = async <M>({
    log,
    project,
    stdlib,
    implicits,
    root,
}: Options<M>): Promise<TactSource | undefined> => {
    const status: Map<string, "pending" | TactSource> = new Map();

    const resolveImports = async (
        path: string,
        log: SourceLogger<M, void>,
        file: Cursor,
        code: string,
    ): Promise<TactSource> => {
        const { imports: rawImports, items } = parse(log, code, path);
        const imports: ResolvedImport[] = [...implicits];
        for (const { importPath, loc } of rawImports) {
            const { language, path, type } = importPath;
            const importedFile =
                type === "relative"
                    ? file.focus(parentPath).focus(path)
                    : stdlib.focus(path);
            if (language === "tact") {
                const source = await resolveSource(importedFile, log);
                if (source) {
                    imports.push(TactImport(source, loc));
                }
            } else {
                imports.push(FuncImport(code, loc));
            }
        }
        return { kind: "tact", path, code, imports, items };
    };

    const resolveSource = async (
        file: Cursor,
        parentLog: AnyLogger<M, void>,
    ): Promise<TactSource | undefined> => {
        const path = file.getAbsolutePathForLog();
        const res = status.get(path);
        if (typeof res === "object") {
            return res;
        }
        if (res === "pending") {
            parentLog.error(
                parentLog.text`Cyclic import: ${parentLog.path(path)}`,
            );
            return;
        }
        status.set(path, "pending");
        const code = await file.read();
        if (!code) {
            return;
        }
        const source = await log.source(path, code, (log) => {
            return resolveImports(path, log, file, code);
        });
        status.set(path, source);
        return source;
    };

    return resolveSource(project.focus(fromString(root)), log);
};

/**
 * Read standard library and prepare for reading projects
 */
export const ProjectReader = async <M>(log: Logger<M, void>) => {
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
        root: "std/stdlib.tact",
    });
    if (!stdStd) {
        // Could not load standard library
        // No compilation is possible
        return;
    }

    /**
     * Read project
     */
    const read = async (fsRootPath: string, tactRoot: string) => {
        const project = createProxyFs({
            log,
            root: fsRootPath,
            isReadonly: false,
        });
        const implicits: ResolvedImport[] = [
            {
                kind: "tact",
                source: stdStd,
                loc: {
                    kind: "implicit",
                },
            },
        ];
        return await readSource({
            log,
            project,
            stdlib: stdLibs,
            implicits,
            root: tactRoot,
        });
    };

    return { read };
};

const TactImport = (source: TactSource, loc: Loc | Implicit) => {
    const result: TactImport = { kind: "tact", source, loc };
    hideProperty(result, "source");
    return result;
};

const FuncImport = (code: string, loc: Loc) => {
    const result: FuncImport = { kind: "func", code, loc };
    hideProperty(result, "code");
    return result;
};

const TactSource = (
    path: string,
    code: string,
    imports: readonly ResolvedImport[],
    items: ModuleItems,
) => {
    const result: TactSource = { kind: "tact", path, code, imports, items };
    hideProperty(result, "code");
    return result;
};
