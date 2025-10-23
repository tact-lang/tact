import type { Logger } from "@/error/logger-util";

export const FsErrors = <M, R>(l: Logger<M, R>) => {
    const regular = {
        ENOENT: (absPath: string) => {
            return l.error(l.text`File not found: ${l.path(absPath)}`);
        },
        EACCES: (absPath: string) => {
            return l.error(l.text`Permission denied: ${l.path(absPath)}`);
        },
        EISDIR: (absPath: string) => {
            return l.error(l.text`Directory is not a file: ${l.path(absPath)}`);
        },
        EMFILE: (absPath: string) => {
            return l.error(l.text`Too many open files: ${l.path(absPath)}`);
        },
        ENAMETOOLONG: (absPath: string) => {
            return l.error(l.text`Filename too long: ${l.path(absPath)}`);
        },
        ENOSPC: (absPath: string) => {
            return l.error(l.text`No space left on device: ${l.path(absPath)}`);
        },
    } as const;
    return {
        regular,
        unexpected: (error: unknown) => {
            throw error;
        },
        outOfRoot: (absPath: string) => {
            return l.error(
                l.text`Outside of the root directory: ${l.path(absPath)}`,
            );
        },
        readonly: (absPath: string) => {
            return l.error(l.text`Filesystem is readonly: ${l.path(absPath)}`);
        },
    };
};

export type FsErrors = ReturnType<typeof FsErrors>;
