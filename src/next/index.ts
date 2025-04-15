import path from "path";
import { parse } from "@/next/grammar";
import { TerminalLogger } from "@/cli/logger";
import { getAnsiMarkup, isColorSupported } from "@/cli/colors";
import { inspect } from "util";
import { emptyPath, fromString } from "@/imports/path";
import { parentPath, createMemoryFs, createProxyFs } from "@/next/fs";
import { getFiles } from "@/next/stdlib";
import type { Cursor } from "@/next/fs";
import type { AnyLogger, Logger, SourceLogger } from "@/error/logger-util";
import type { ModuleItem, Range } from "@/next/ast";

const target = "wallet-v4.tact";
// const target = "generic.tact";
// const target = "union.tact";
// const target = "alias.tact";

const dump = (obj: unknown) =>
    // eslint-disable-next-line @typescript-eslint/no-confusing-void-expression
    console.log(inspect(obj, { colors: true, depth: Infinity }));

export type TactSource = {
    readonly code: string;
    readonly imports: readonly Import[];
    readonly items: readonly ModuleItem[];
};
export type Import = TactImport | FuncImport
export type TactImport = {
    readonly kind: 'tact';
    readonly source: TactSource;
    readonly loc: Range;
}
export type FuncImport = {
    readonly kind: 'func';
    readonly code: string;
    readonly loc: Range;
}

const fakeSource: TactSource = { code: '', imports: [], items: [] };

const readSource = async (
    log: Logger<string, void>,
    project: Cursor,
    stdlib: Cursor,
    implicits: readonly Import[],
    rootModule: string,
): Promise<TactSource> => {
    const status: Map<string, 'pending' | TactSource> = new Map();

    const resolveImports = async (
        log: SourceLogger<string, void>,
        file: Cursor,
        code: string,
    ): Promise<TactSource> => {
        const { imports: rawImports, items } = parse(log, code);
        const imports: Import[] = [...implicits];
        for (const { importPath, loc } of rawImports) {
            const { language, path, type } = importPath;
            const importedFile = type === 'relative'
                ? file.focus(parentPath).focus(path)
                : stdlib.focus(path);
            if (language === 'tact') {
                const source = await resolveSource(importedFile, log);
                imports.push({ kind: 'tact', source, loc });
            } else {
                imports.push({ kind: 'func', code, loc });
            }
        }
        return { code, imports, items };
    };

    const resolveSource = async (
        file: Cursor,
        parentLog: AnyLogger<string, void>,
    ): Promise<TactSource> => {
        const path = file.getAbsolutePathForLog();
        const res = status.get(path);
        if (typeof res === 'object') {
            return res;
        }
        if (res === 'pending') {
            parentLog.error(parentLog.text`Cyclic import: ${parentLog.path(path)}`);
            return fakeSource;
        }
        status.set(path, 'pending');
        const code = await file.read();
        if (!code) {
            return fakeSource;
        }
        const source = await log.source(path, code, (log) => {
            return resolveImports(log, file, code);
        });
        status.set(path, source);
        return source;
    };

    return resolveSource(
        project.focus(fromString(rootModule)),
        log,
    );
};

export const ProjectReader = async (log: Logger<string, void>) => {
    const stdRoot = createMemoryFs(
        log,
        getFiles(),
        emptyPath,
        true,
    );
    const stdLibs = stdRoot.focus(fromString("libs"));
    const stdStd = await readSource(
        log,
        stdRoot,
        stdLibs,
        [],
        'std/stdlib.tact',
    );

    const read = async (
        fsRootPath: string,
        tactRoot: string,
    ) => {
        const project = createProxyFs(
            log,
            fsRootPath,
            false,
        );
        return await readSource(
            log,
            project,
            stdLibs,
            [{
                kind: 'tact',
                source: stdStd,
                loc: { start: 0, end: 0 },
            }],
            tactRoot,
        );
    };
    
    return { read };
};

const main = async () => {
    const ansi = getAnsiMarkup(isColorSupported());
    await TerminalLogger(path, "info", ansi, async (log) => {
        await log.recover(async (log) => {
            const reader = await ProjectReader(log);
            const root = await reader.read(
                path.join(__dirname, "example"),
                target,
            );
            console.log(root);
        });
    });
};

void main();
