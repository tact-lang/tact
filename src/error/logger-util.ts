import { catchUncolored } from "./async-util";
import { TactInternalError } from "./errors";
import { Range } from "./range";

/**
 * Methods for formatting an error message
 */
export interface Formatter<M> {
    /**
     * Substitutions into template literal
     * Creates a single message, possible with some parts of it rendered in a
     * different way.
     */
    readonly text: (
        parts: TemplateStringsArray,
        ...subst: readonly (string | M)[]
    ) => M;

    /**
     * Absolute path token
     * Displayed in blue in CLI and as link in IDE
     * Displayed relative to `cwd` in CLI or workspace root in IDE
     * External tooling can use absolute path in other ways
     */
    readonly path: (path: string) => M;

    /**
     * Refer to `id` in a `path` file at `range`
     * In IDE should display as a link with `id` as text
     */
    readonly locatedId: (id: string, path: string, range: Range) => M;

    /**
     * Token for a list of expected strings
     */
    readonly expected: (guesses: ReadonlySet<string>) => M;
}

/**
 * Basic logger interface
 */
export interface BaseLogger<M, R> {
    /**
     * Throw internal error
     *
     * If internal error is not related to currently source and range,
     * `internal()` from `errors.ts` will work as well
     */
    readonly internal: (message: M) => never;

    /**
     * Throw compilation error
     */
    readonly error: (message: M) => R;

    /**
     * Display a warning
     */
    readonly warn: (message: M) => void;

    /**
     * Log something not that important
     */
    readonly info: (message: M) => void;

    /**
     * Even if using error recovery, exit compilation right now and there
     *
     * Used at the end of compilation stage, if continuing compilation is
     * considered dangerous due to potentially broken internal compiler state
     */
    readonly exitIfErrored: () => void;
}

/**
 * (Co-)map message types of base logger
 *
 * Used when we need to add something to every message
 */
export const mapBaseLogger = <M1, M2, R>(
    log: BaseLogger<M1, R>,
    f: (m: M2) => M1,
): BaseLogger<M2, R> => ({
    exitIfErrored: log.exitIfErrored,
    internal: (m) => log.internal(f(m)),
    error: (m) => log.error(f(m)),
    warn: (m) => {
        log.warn(f(m));
    },
    info: (m) => {
        log.info(f(m));
    },
});

/**
 * Logger that knows about currently compiled file
 */
export interface SourceLogger<M, R> extends Formatter<M>, BaseLogger<M, R> {
    /**
     * Choose range where an error will be shown
     */
    at: (range: Range) => BaseLogger<M, R>;

    /**
     * Handle multiple errors in callback without throwing them
     */
    recover: <T>(cb: (logger: SourceLogger<M, void>) => T) => T;
}

/**
 * Top-level logger
 */
export interface Logger<M, R> extends Formatter<M>, BaseLogger<M, R> {
    /**
     * Set currently compiled source in logging context
     */
    source: <T>(
        path: string,
        code: string,
        cb: (logger: SourceLogger<M, R>) => T,
    ) => T;

    /**
     * Handle multiple errors in callback without throwing them
     */
    recover: <T>(cb: (logger: Logger<M, void>) => T) => T;
}

/**
 * Error used to stop compilation
 *
 * @private Do not use outside of this file!
 */
export class _ExitError extends Error {}

/**
 * Stop compilation
 *
 * @private Do not use outside of this file!
 */
export const _exit = () => {
    throw new _ExitError();
};

/**
 * Do not stop compilation
 *
 * @private Do not use outside of this file!
 */
export const _ignore = () => {};

/**
 * Used internally to handle errors that bubbled to root logger
 */
export const handleTopLevelErrors = <M, T, U>(
    log: Logger<M, unknown>,
    cb: () => T,
    onExit: () => U,
) => {
    // `catchUncolored` is instrumental here, to allow `T` to be either
    // regular value or a `Promise`
    return catchUncolored<T | U>(
        () =>
            catchUncolored(cb, (e) => {
                if (e instanceof _ExitError) {
                    // Exit will be handled below
                    throw e;
                } else if (e instanceof TactInternalError) {
                    // Format `throwInternal()` and rethrow it as regular error
                    // Will throw ExitError
                    return log.internal(log.text`${e.formattedMessage}`);
                } else {
                    // For any other error, convert it to string and rethrow as
                    // regular error. Will throw ExitError
                    const text = e instanceof Error ? e.toString() : String(e);
                    return log.internal(log.text`Unhandled: ${text}`);
                }
            }),
        (e) => {
            if (e instanceof _ExitError) {
                return onExit();
            } else {
                // impossible, but throw anyway
                throw e;
            }
        },
    );
};

/**
 * Messages of errors that are `throw`n should at least be expanded with
 * context, in while file they happened
 */
export const rethrowWithPath = (error: unknown, path: string) => {
    if (error instanceof TactInternalError) {
        error.formattedMessage = `${error.formattedMessage}\nwhile compiling ${path}`;
    } else if (error instanceof Error) {
        error.message = `${error.message}\nwhile compiling ${path}`;
    }
    throw error;
};

/**
 * Loggers need both single-error and multi-error loggers
 * Depending on `onError` handler (`exit` or `ignore`), they will do either
 *
 * `createChildLoggers` creates another error logging scope, that
 * computes its own `hadErrors` flag, and also sets `hadErrors` on all of its
 * parent scopes.
 */
type BaseLoggers<M> = <R>(onError: () => R) => BaseLogger<M, R>;
const createChildLoggers = <M>(getBase: BaseLoggers<M>): BaseLoggers<M> => {
    let hadErrors = false;
    return (onError) => {
        const base = getBase(onError);
        return {
            ...base,
            exitIfErrored: () => {
                if (hadErrors) return _exit();
                // If this scope is not in error state, maybe its parent is
                base.exitIfErrored();
            },
            internal: (m) => {
                // We won't use this value, because `.internal()` immediately
                // exits the application anyway, but it's better to be consistent
                hadErrors = true;
                return base.internal(m);
            },
            error: (m) => {
                hadErrors = true;
                return base.error(m);
            },
        };
    };
};

/**
 * Create top-level single-error and multi-error loggers
 */
const makeBaseLoggers = <M>(iface: LoggerHandlers<M, unknown>) =>
    createChildLoggers<M>((onError) => ({
        exitIfErrored: () => {},
        internal: (message: M) => {
            iface.internal(message);
            // Internal errors directly exit the application
            return _exit();
        },
        error: (message: M) => {
            iface.error(message);
            // Behavior of this call distinguished single and multiple errors
            // if `onError` throws, it's a single error
            return onError();
        },
        warn: iface.warn,
        info: iface.info,
    }));

/**
 * Set of handlers that are different between logger implementations
 *
 * This interface is a simplified version of logger, so that we can implement
 * a new kind of logger without copying complex error message builders
 */
export interface LoggerHandlers<M, R> {
    readonly internal: (message: M) => void;
    readonly error: (message: M) => void;
    readonly warn: (message: M) => void;
    readonly info: (message: M) => void;
    readonly text: (
        parts: TemplateStringsArray,
        ...subst: readonly (string | M)[]
    ) => M;
    readonly path: (path: string) => M;
    readonly locatedId: (id: string, path: string, range: Range) => M;
    readonly expected: (guesses: ReadonlySet<string>) => M;
    readonly atPath: (path: string, message: M) => M;
    readonly atRange: (
        path: string,
        code: string,
        range: Range,
        message: M,
    ) => M;
    readonly onExit: () => R;
}

/**
 * Create user-facing logger from its internal representation and
 * application entrypoint
 */
export const makeLogger = <M, T>(
    iface: LoggerHandlers<M, T>,
    compile: (log: Logger<M, never>) => T,
) => {
    // Create a simple text logger
    const formatter: Formatter<M> = {
        text: iface.text,
        path: iface.path,
        expected: iface.expected,
        locatedId: iface.locatedId,
    };

    // Create a logger with a given source file in context
    const makeSourceLogger = <R>(
        path: string,
        code: string,
        baseLoggers: BaseLoggers<M>,
        handle: () => R,
    ): SourceLogger<M, R> => ({
        ...formatter,
        ...mapBaseLogger(baseLoggers(handle), (m) => iface.atPath(path, m)),
        at: (range) =>
            mapBaseLogger(baseLoggers(handle), (m) =>
                iface.atRange(path, code, range, m),
            ),
        recover: (cb) => cb(makeSourceLogger(path, code, baseLoggers, _ignore)),
    });

    // Create a function that returns a logger with source file context, and also
    // add context to all the native JS errors that pass through it
    const makeSourceFunction =
        <R>(baseLoggers: BaseLoggers<M>, handle: () => R) =>
        <T>(
            path: string,
            code: string,
            cb: (logger: SourceLogger<M, R>) => T,
        ): T => {
            // `catchUncolored` is instrumental here, to allow `T` to be either
            // regular value or a `Promise`
            return catchUncolored(
                () =>
                    cb(
                        makeSourceLogger(
                            path,
                            code,
                            createChildLoggers(baseLoggers),
                            handle,
                        ),
                    ),
                (error) => rethrowWithPath(error, path),
            );
        };

    // Create top-level logger, for one or several error messages, depending on `handle`
    const makeLogger = <R>(
        baseLoggers: BaseLoggers<M>,
        handle: () => R,
    ): Logger<M, R> => ({
        ...formatter,
        ...baseLoggers(handle),
        source: makeSourceFunction(baseLoggers, handle),
        recover: makeRecover(baseLoggers),
    });

    // Create a top-level multi-error logger
    const makeRecover =
        (baseLoggers: BaseLoggers<M>) =>
        <T>(cb: (logger: Logger<M, void>) => T): T => {
            return cb(makeLogger(createChildLoggers(baseLoggers), _ignore));
        };

    // Create top-level one-error logger
    const logger = makeLogger(makeBaseLoggers(iface), _exit);

    // Run application, catch all uncaught/internal errors and dispatch them as errors in log
    return handleTopLevelErrors(
        logger,
        () => {
            const result = compile(logger);
            logger.exitIfErrored();
            return result;
        },
        iface.onExit,
    );
};
