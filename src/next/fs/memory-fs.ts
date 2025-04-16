import { appendPath, asString, emptyPath } from "@/next/fs/util";
import { FsErrors } from "@/next/fs/errors";

import type { RelativePath } from "@/next/fs/path";
import type { Cursor } from "@/next/fs/cursor";
import type { Logger } from "@/error/logger-util";

type Options = {
    // FIXME: should we pass log here, or into functions?
    readonly log: Logger<string, void>,

    /**
     * Files present in memory file system at creation time
     */
    readonly files: Map<string, Blob>,

    /**
     * Path to the root, used only for logging
     * 
     * Absolute paths do not make sense in memory FS, as
     * it doesn't have the actual root
     */
    readonly root: RelativePath,

    /**
     * Whether it's possible to `write` into
     */
    readonly isReadonly: boolean,
}

export const emptyFiles: Map<string, Blob> = new Map();

/**
 * Create in-memory file system
 */
export function createMemoryFs(
    { log, files, root, isReadonly }: Options
): Cursor {
    const errors = FsErrors(log);

    function builder(currPath: RelativePath): Cursor {
        const getAbsolutePathForLog = () => {
            return asString(appendPath(root, currPath));
        };
        return {
            getAbsolutePathForLog,
            focus: (path) => {
                const newPath = appendPath(currPath, path);
                if (newPath.stepsUp !== 0) {
                    errors.outOfRoot(getAbsolutePathForLog());
                }
                return builder(newPath);
            },
            read: async () => {
                const fullPath = asString(appendPath(root, currPath));
                const blob = files.get(fullPath);
                if (typeof blob === "undefined") {
                    errors.regular.ENOENT(getAbsolutePathForLog());
                    return;
                }
                return new TextDecoder("utf-8").decode(
                    await blob.arrayBuffer(),
                );
            },
            // eslint-disable-next-line @typescript-eslint/require-await
            write: async (content) => {
                if (isReadonly) {
                    errors.readonly(getAbsolutePathForLog());
                }
                const fullPath = asString(appendPath(root, currPath));
                const blob =
                    typeof content === "string"
                        ? new Blob([content], {
                              type: "text/plain;charset=utf-8",
                          })
                        : content;
                files.set(fullPath, blob);
            },
        };
    }

    return builder(emptyPath);
}
