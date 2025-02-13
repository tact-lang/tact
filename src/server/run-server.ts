import { thenUncolored } from "../error/async-util";
import { Logger, LoggerHandlers, makeLogger } from "../error/logger-util";
import { Range } from "../error/range";

/**
 * Error level
 *
 * For `internal` errors a popup with link to GitHub issues should be shown
 */
export type ErrorLevel = "internal" | "error" | "warn" | "info";

export type LogEntry = {
    readonly level: ErrorLevel;
    readonly message: Message;
};

export type Message =
    | MessageText
    | MessagePath
    | MessageLocatedId
    | MessageExpected
    | MessageSource;

/**
 * Text with substitutions
 *
 * Format matches template literals in JS. For N >= 0,
 * - `parts` will always have odd number of elements N+1
 * - `subst` will always have even number of elements N
 *
 * parts: ['A', 'C', 'E'], subst: ['B', 'D'] -> `ABCDE`
 *
 * If `Message` is converted to simple text, `showTemplate`
 * can further convert this back to string.
 */
export type MessageText = {
    readonly kind: "text";
    readonly parts: readonly string[];
    readonly subst: readonly (string | Message)[];
};

/**
 * Display a path
 */
export type MessagePath = {
    readonly kind: "path";
    /**
     * Absolute path
     *
     * In compiler we don't know where this path will be shown,
     * so we can't make it relative to anything
     */
    readonly path: string;
};

/**
 * Display a reference to identifier at some location in source
 *
 * Should display as a link with `id` as text, with click sending to
 * `range` of `path`.
 */
export type MessageLocatedId = {
    readonly kind: "locatedId";
    /**
     * Link text
     */
    readonly id: string;
    /**
     * Absolute path
     *
     * In compiler we don't know where this path will be shown,
     * so we can't make it relative to anything
     */
    readonly path: string;
    /**
     * Range where `id` is defined, used or otherwise mentioned
     */
    readonly range: Range;
};

/**
 * A set of expected strings
 *
 * If it's just shown, and not used for autofix purposes,
 * use `showExpectedText` from `string-util` to convert it to string
 */
export type MessageExpected = {
    readonly kind: "expected";
    readonly values: ReadonlySet<string>;
};

/**
 * Tells in which file an error happened
 */
export type MessageSource = {
    readonly kind: "source";
    readonly path: string;
    readonly message: Message;
    readonly range: Range | undefined;
};

/**
 * Logger for running Tact as a library
 */
export const runServer = <T>(compile: (log: Logger<Message, never>) => T) => {
    const log: LogEntry[] = [];
    const jsonIface: LoggerHandlers<Message, undefined> = {
        internal: (message) => log.push({ level: "internal", message }),
        error: (message) => log.push({ level: "error", message }),
        warn: (message) => log.push({ level: "warn", message }),
        info: (message) => log.push({ level: "info", message }),
        path: (path) => ({ kind: "path", path }),
        locatedId: (id, path, range) => ({
            kind: "locatedId",
            id,
            path,
            range,
        }),
        expected: (values) => ({ kind: "expected", values }),
        text: (parts, ...subst) => ({ kind: "text", parts: [...parts], subst }),
        atPath: (path, message) => ({
            kind: "source",
            path,
            message,
            range: undefined,
        }),
        atRange: (path, code, range, message) => ({
            kind: "source",
            path,
            message,
            range,
        }),
        onExit: () => undefined,
    };
    return thenUncolored(makeLogger(jsonIface, compile), () => log);
};
