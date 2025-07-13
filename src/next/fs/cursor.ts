import type { RelativePath } from "@/next/fs/path";

/**
 * Points to a node of a file system: directory or file
 */
export interface Cursor {
    /**
     * Move cursor by given relative path
     */
    readonly focus: (path: RelativePath) => this;

    /**
     * Read file under the cursor
     */
    readonly read: () => Promise<string | undefined>;

    /**
     * Write to file under the cursor
     */
    readonly write: (content: string | Blob) => Promise<void>;

    /**
     * Get full absolute path to a file or directory
     *
     * NB! Only to be used with `log.source()`
     */
    readonly getAbsolutePathForLog: () => string;
}
