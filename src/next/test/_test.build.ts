import { createMemoryFs, createProxyFs, fromString } from "@/next/fs";
import { ProjectReader, readSource } from "@/next/imports/reader";
import { toJs } from "@/next/test/to-code";
import { typecheck } from "@/next/types/typecheck";
import { runServer } from "@/server/run-server";
import { basename, dirname } from "path";
import type { Logger } from "@/error/logger-util";
import type { ResolvedImport, TactSource } from "@/next/imports/source";
import { lowerSource } from "@/next/types/lower";
import { runLog } from "@/next/ast";

export const runTest = async (path: string): Promise<string> => {
    let source: TactSource | undefined;
    const entries = await runServer(async (log) => {
        await log.recover(async (log) => {
            // const result = await buildNoStdlib(log, path);
            const result = await buildE2E(log, path);

            if (!result) {
                return;
            }

            source = result;
        });
    });
    if (entries.length > 0 || !source) {
        return toJs(entries);
    }
    const [csource, errors1] = typecheck(source);
    const [lowered, errors2] = runLog(lowerSource(csource));
    return toJs({ lowered, errors: [...errors1, ...errors2] });
};

export const buildE2E = async <M>(log: Logger<M, void>, path: string) => {
    const reader = await ProjectReader(log);
    if (!reader) {
        return;
    }
    return await reader.read(dirname(path), basename(path));
};

export const buildNoStdlib = async <M>(log: Logger<M, void>, path: string) => {
    const project = createProxyFs({
        log,
        root: dirname(path),
        isReadonly: false,
    });
    const implicits: ResolvedImport[] = [];
    return await readSource({
        log,
        project,
        stdlib: createMemoryFs({
            log,
            files: new Map(),
            isReadonly: true,
            root: fromString("."),
        }),
        implicits,
        root: basename(path),
    });
};
