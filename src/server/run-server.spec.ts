import { throwInternal } from "@/error/errors";
import type { Logger, SourceLogger } from "@/error/logger-util";
import type { Range } from "@/error/range";
import { runServer } from "@/server/run-server";
import { step } from "@/test/allure/allure";

describe("runServer", () => {
    test("only first error without error recovery", async () => {
        const result = runServer((log) => {
            log.error(log.text`Error 1`);
            log.error(log.text`Error 2`);
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("all info logs are logged", async () => {
        const result = runServer((log) => {
            log.info(log.text`Info 1`);
            log.info(log.text`Info 2`);
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("raw internal error", async () => {
        const result = runServer((_log) => {
            throwInternal(`OMG`);
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("logger internal error", async () => {
        const result = runServer((log) => {
            log.internal(log.text`OMG`);
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("raw internal error in source", async () => {
        const result = runServer((log) => {
            log.source("/foo/bar", "Hello, world", () => {
                throwInternal(`OMG`);
            });
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("logger internal error in source", async () => {
        const result = runServer((log) => {
            log.source("/foo/bar", "Hello, world", (log) => {
                log.internal(log.text`OMG`);
                log.info(log.text`Impossible`);
            });
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("internal error in source at range", async () => {
        const result = runServer((log) => {
            log.source("/foo/bar", "Hello, world", (log) => {
                log.at({ start: 3, end: 5 }).internal(log.text`OMG`);
                log.info(log.text`Impossible`);
            });
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("uncaught error", async () => {
        const result = runServer(() => {
            throw new Error("Uncaught!");
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("uncaught error in source", async () => {
        const result = runServer((log) => {
            return log.source("/foo/bar", "Hello, world", () => {
                throw new Error("hehe");
            });
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("multiple errors", async () => {
        const result = runServer((log) => {
            log.recover((log) => {
                log.error(log.text`foo`);
                log.error(log.text`bar`);
            });
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("exit on error", async () => {
        const result = runServer((log) => {
            log.recover((log) => {
                log.error(log.text`foo`);
                log.error(log.text`bar`);
                log.exitIfErrored();
            });
            log.error(log.text`impossible`);
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("multiple errors inside source", async () => {
        const result = runServer((log) => {
            log.source("/foo/bar", "Hello, world", (log) => {
                log.recover((log) => {
                    log.at({ start: 3, end: 5 }).error(log.text`foo`);
                    log.error(log.text`bar`);
                    log.exitIfErrored();
                });
                log.error(log.text`impossible`);
            });
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("source inside multiple errors", async () => {
        const result = runServer((log) => {
            log.recover((log) => {
                log.source("/foo/bar", "Hello, world", (log) => {
                    log.at({ start: 3, end: 5 }).error(log.text`foo`);
                    log.error(log.text`bar`);
                    log.exitIfErrored();
                });
                log.error(log.text`impossible`);
            });
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("typed errors", async () => {
        const fooBarSchema = <M, R>(l: Logger<M, R>) => ({
            fooError: () => l.error(l.text`Foo!`),
            barError: () => l.error(l.text`Bar!`),
        });
        const result = runServer((log) => {
            log.recover((log) => {
                const l = fooBarSchema(log);
                l.fooError();
                l.barError();
            });
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    test("typed errors for source", async () => {
        const fooBarSchemaSrc = <M, R>(l: SourceLogger<M, R>) => ({
            fooError: (at: Range) => l.at(at).error(l.text`Foo!`),
            barError: () => l.error(l.text`Bar!`),
        });
        const result = runServer((log) => {
            log.source("/foo/bar", "Hello, world", (log) => {
                log.recover((log) => {
                    const l = fooBarSchemaSrc(log);
                    l.fooError({ start: 3, end: 5 });
                    l.barError();
                });
            });
        });
        await step("RunServer result should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });
});
