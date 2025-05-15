import { createMemoryFs, createProxyFs, fromString } from "@/next/fs";
import { ProjectReader, readSource } from "@/next/imports/reader";
import { toJs } from "@/next/test/to-code";
import { typecheck } from "@/next/types/typecheck";
import { runServer } from "@/server/run-server";
import { basename, dirname } from "path";
import type { Logger } from "@/error/logger-util";
import type { ResolvedImport } from "@/next/imports/source";

export const runTest = async (path: string): Promise<string> => {
    let types: unknown;
    const result = await runServer(async (log) => {
        await log.recover(async (log) => {
            const result = await buildNoStdlib(log, path);

            if (!result) {
                return;
            }

            const tcResult = typecheck(result);
            types = tcResult.errors.length
                ? { errors: tcResult.errors }
                : { scope: tcResult.value };
        });
    });
    return toJs({ types, result });
};

export const buildE2E = async <M>(
    log: Logger<M, void>,
    path: string,
) => {
    const reader = await ProjectReader(log);
    if (!reader) {
        return;
    }
    return await reader.read(
        dirname(path),
        basename(path),
    );
}

export const buildNoStdlib = async <M>(
    log: Logger<M, void>,
    path: string,
) => {
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
            root: fromString('.'),
        }),
        implicits,
        root: basename(path),
    });
};