/* eslint-disable @typescript-eslint/no-confusing-void-expression */
import { throwInternal } from "../error/errors";
import { Logger, SourceLogger } from "../error/logger-util";
import { Range } from "../error/range";
import { getColors } from "./colors";
import { TerminalLogger } from "./logger";

const catchProcessExit = <T>(fn: () => T): T | string => {
    const exitSpy = jest.spyOn(process, "exit").mockImplementation((code) => {
        throw new Error(`process.exit called with code ${code}`);
    });

    let result: T | null = null;
    let caughtError: unknown = null;

    try {
        result = fn();
    } catch (error) {
        caughtError = error;
    }

    exitSpy.mockRestore();

    if (caughtError) {
        return (caughtError as Error).message.includes("process.exit called")
            ? (caughtError as Error).message
            : "Unknown error";
    }

    return result as T;
};

describe("TerminalLogger", () => {
    const colors = getColors(false);

    test("only first error without error recovery", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                log.error(log.text`Error 1`);
                log.error(log.text`Error 2`);
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        logSpy.mockRestore();
    });

    test("all info logs are logged", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                log.info(log.text`Info 1`);
                log.info(log.text`Info 2`);
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        logSpy.mockRestore();
    });

    test("warn verbosity does not show info", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger("warn", colors, (log) => {
                log.warn(log.text`Warn`);
                log.info(log.text`Info`);
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        logSpy.mockRestore();
    });

    test("path is resolved relative to cwd", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                log.error(log.text`See ${log.path("/foo/bar")}.`);
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("raw internal error", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (_log) => {
                throwInternal(`OMG`);
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        logSpy.mockRestore();
    });

    test("logger internal error", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                log.internal(log.text`OMG`);
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        logSpy.mockRestore();
    });

    test("raw internal error in source", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                log.source("/foo/bar", "Hello, world", () => {
                    throwInternal(`OMG`);
                });
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("logger internal error in source", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                log.source("/foo/bar", "Hello, world", (log) => {
                    log.internal(log.text`OMG`);
                    log.info(log.text`Impossible`);
                });
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("internal error in source at range", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                log.source("/foo/bar", "Hello, world", (log) => {
                    log.at({ start: 3, end: 5 }).internal(log.text`OMG`);
                    log.info(log.text`Impossible`);
                });
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("uncaught error", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, () => {
                throw new Error("Uncaught!");
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        logSpy.mockRestore();
    });

    test("uncaught error in source", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                return log.source("/foo/bar", "Hello, world", () => {
                    throw new Error("hehe");
                });
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("multiple errors", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                log.recover((log) => {
                    log.error(log.text`foo`);
                    log.error(log.text`bar`);
                });
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        logSpy.mockRestore();
    });

    test("exit on error", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                log.recover((log) => {
                    log.error(log.text`foo`);
                    log.error(log.text`bar`);
                    log.exitIfErrored();
                });
                log.error(log.text`impossible`);
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        logSpy.mockRestore();
    });

    test("multiple errors inside source", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                log.source("/foo/bar", "Hello, world", (log) => {
                    log.recover((log) => {
                        log.at({ start: 3, end: 5 }).error(log.text`foo`);
                        log.error(log.text`bar`);
                        log.exitIfErrored();
                    });
                    log.error(log.text`impossible`);
                });
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("source inside multiple errors", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                log.recover((log) => {
                    log.source("/foo/bar", "Hello, world", (log) => {
                        log.at({ start: 3, end: 5 }).error(log.text`foo`);
                        log.error(log.text`bar`);
                        log.exitIfErrored();
                    });
                    log.error(log.text`impossible`);
                });
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("typed errors", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const fooBarSchema = <M, R>(l: Logger<M, R>) => ({
            fooError: () => l.error(l.text`Foo!`),
            barError: () => l.error(l.text`Bar!`),
        });
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                log.recover((log) => {
                    const l = fooBarSchema(log);
                    l.fooError();
                    l.barError();
                });
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("typed errors for source", () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const fooBarSchemaSrc = <M, R>(l: SourceLogger<M, R>) => ({
            fooError: (at: Range) => l.at(at).error(l.text`Foo!`),
            barError: () => l.error(l.text`Bar!`),
        });
        const result = catchProcessExit(() => {
            return TerminalLogger("info", colors, (log) => {
                log.source("/foo/bar", "Hello, world", (log) => {
                    log.recover((log) => {
                        const l = fooBarSchemaSrc(log);
                        l.fooError({ start: 3, end: 5 });
                        l.barError();
                    });
                });
            });
        });
        expect(result).toMatchSnapshot();
        expect(logSpy.mock.calls).toMatchSnapshot();
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });
});
