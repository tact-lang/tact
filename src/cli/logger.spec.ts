/* eslint-disable @typescript-eslint/no-confusing-void-expression */
import { throwInternal } from "@/error/errors";
import type { Logger, SourceLogger } from "@/error/logger-util";
import type { Range } from "@/error/range";
import { getAnsiMarkup } from "@/cli/colors";
import { TerminalLogger } from "@/cli/logger";
import pathWindows from "path/win32";
import pathPosix from "path/posix";
import { step } from "@/test/allure/allure";

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

const os = [
    ["Windows", pathWindows],
    ["POSIX", pathPosix],
] as const;

describe.each(os)("TerminalLogger %s", (_, pathApi) => {
    const ansi = getAnsiMarkup(false);

    test("only first error without error recovery", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
                log.error(log.text`Error 1`);
                log.error(log.text`Error 2`);
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        logSpy.mockRestore();
    });

    test("all info logs are logged", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
                log.info(log.text`Info 1`);
                log.info(log.text`Info 2`);
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        logSpy.mockRestore();
    });

    test("warn verbosity does not show info", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "warn", ansi, (log) => {
                log.warn(log.text`Warn`);
                log.info(log.text`Info`);
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        logSpy.mockRestore();
    });

    test("path is resolved relative to cwd", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
                log.error(log.text`See ${log.path("/foo/bar")}.`);
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("raw internal error", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (_log) => {
                throwInternal(`OMG`);
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        logSpy.mockRestore();
    });

    test("logger internal error", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
                log.internal(log.text`OMG`);
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        logSpy.mockRestore();
    });

    test("raw internal error in source", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
                log.source("/foo/bar", "Hello, world", () => {
                    throwInternal(`OMG`);
                });
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("logger internal error in source", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
                log.source("/foo/bar", "Hello, world", (log) => {
                    log.internal(log.text`OMG`);
                    log.info(log.text`Impossible`);
                });
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("internal error in source at range", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
                log.source("/foo/bar", "Hello, world", (log) => {
                    log.at({ start: 3, end: 5 }).internal(log.text`OMG`);
                    log.info(log.text`Impossible`);
                });
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("uncaught error", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, () => {
                throw new Error("Uncaught!");
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        logSpy.mockRestore();
    });

    test("uncaught error in source", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
                return log.source("/foo/bar", "Hello, world", () => {
                    throw new Error("hehe");
                });
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("multiple errors", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
                log.recover((log) => {
                    log.error(log.text`foo`);
                    log.error(log.text`bar`);
                });
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        logSpy.mockRestore();
    });

    test("exit on error", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
                log.recover((log) => {
                    log.error(log.text`foo`);
                    log.error(log.text`bar`);
                    log.exitIfErrored();
                });
                log.error(log.text`impossible`);
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        logSpy.mockRestore();
    });

    test("multiple errors inside source", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
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
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("source inside multiple errors", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
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
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("typed errors", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const fooBarSchema = <M, R>(l: Logger<M, R>) => ({
            fooError: () => l.error(l.text`Foo!`),
            barError: () => l.error(l.text`Bar!`),
        });
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
                log.recover((log) => {
                    const l = fooBarSchema(log);
                    l.fooError();
                    l.barError();
                });
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });

    test("typed errors for source", async () => {
        const logSpy = jest.spyOn(console, "log").mockImplementation(() => {});
        const cwdSpy = jest.spyOn(process, "cwd").mockReturnValue("/foo");
        const fooBarSchemaSrc = <M, R>(l: SourceLogger<M, R>) => ({
            fooError: (at: Range) => l.at(at).error(l.text`Foo!`),
            barError: () => l.error(l.text`Bar!`),
        });
        const result = catchProcessExit(() => {
            return TerminalLogger(pathApi, "info", ansi, (log) => {
                log.source("/foo/bar", "Hello, world", (log) => {
                    log.recover((log) => {
                        const l = fooBarSchemaSrc(log);
                        l.fooError({ start: 3, end: 5 });
                        l.barError();
                    });
                });
            });
        });
        await step("Result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
        await step("Console log calls should match snapshot", () => {
            expect(logSpy.mock.calls).toMatchSnapshot();
        });
        cwdSpy.mockRestore();
        logSpy.mockRestore();
    });
});
