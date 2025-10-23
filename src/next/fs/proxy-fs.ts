import { mkdir, readFile, writeFile } from "fs/promises";
import { dirname, isAbsolute, join } from "path";

import { appendPath, asString, emptyPath } from "@/next/fs/util";
import { throwInternal } from "@/error/errors";
import { FsErrors } from "@/next/fs/errors";
import type { Cursor } from "@/next/fs/cursor";
import type { RelativePath } from "@/next/fs/path";
import type { Logger } from "@/error/logger-util";

const asRecord = <T>(t: Record<string, T>) => t;

type Options = {
    readonly log: Logger<string, void>;
    readonly root: string;
    readonly isReadonly: boolean;
};

/**
 * Create file system that proxies requests to real file system
 */
export function createProxyFs({ log, root, isReadonly }: Options): Cursor {
    const errors = FsErrors(log);

    function builder(currPath: RelativePath): Cursor {
        const getAbsolutePathForLog = () => {
            return join(root, asString(currPath));
        };

        async function catchCommonFsErrors<T>(cb: () => Promise<T>) {
            try {
                return await cb();
            } catch (error) {
                if (!(error instanceof Error) || !("code" in error)) {
                    return errors.unexpected(error);
                }
                const code = error.code;
                if (typeof code !== "string") {
                    return errors.unexpected(error);
                }
                const handlers = asRecord(errors.regular);
                const handler = handlers[code];
                // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
                if (handler) {
                    handler(getAbsolutePathForLog());
                    return;
                } else {
                    return errors.unexpected(error);
                }
            }
        }

        return {
            getAbsolutePathForLog,
            focus: (path) => {
                const newPath = appendPath(currPath, path);
                if (newPath.stepsUp !== 0) {
                    errors.outOfRoot(getAbsolutePathForLog());
                }
                return builder(newPath);
            },
            read: () => {
                return catchCommonFsErrors(() => {
                    return readFile(join(root, asString(currPath)), "utf-8");
                });
            },
            write: async (content) => {
                if (isReadonly) {
                    errors.readonly(getAbsolutePathForLog());
                }
                await catchCommonFsErrors(async () => {
                    const fullPath = join(root, asString(currPath));
                    await mkdir(dirname(fullPath), { recursive: true });
                    const encodedContent =
                        typeof content === "string"
                            ? content
                            : Buffer.from(await content.arrayBuffer());
                    await writeFile(fullPath, encodedContent);
                });
            },
        };
    }

    if (!isAbsolute(root)) {
        throwInternal("Cannot pass relative paths");
    }

    return builder(emptyPath);
}
