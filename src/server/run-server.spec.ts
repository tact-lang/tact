import { throwInternal } from "../error/errors";
import { Logger, SourceLogger } from "../error/logger-util";
import { Range } from "../error/range";
import { runServer } from "./run-server";

describe("runServer", () => {
    test("only first error without error recovery", () => {
        const result = runServer((log) => {
            log.error(log.text`Error 1`);
            log.error(log.text`Error 2`);
        });
        expect(result).toMatchSnapshot();
    });

    test("all info logs are logged", () => {
        const result = runServer((log) => {
            log.info(log.text`Info 1`);
            log.info(log.text`Info 2`);
        });
        expect(result).toMatchSnapshot();
    });

    test("raw internal error", () => {
        const result = runServer((_log) => {
            throwInternal(`OMG`);
        });
        expect(result).toMatchSnapshot();
    });

    test("logger internal error", () => {
        const result = runServer((log) => {
            log.internal(log.text`OMG`);
        });
        expect(result).toMatchSnapshot();
    });

    test("raw internal error in source", () => {
        const result = runServer((log) => {
            log.source("/foo/bar", "Hello, world", () => {
                throwInternal(`OMG`);
            });
        });
        expect(result).toMatchSnapshot();
    });

    test("logger internal error in source", () => {
        const result = runServer((log) => {
            log.source("/foo/bar", "Hello, world", (log) => {
                log.internal(log.text`OMG`);
                log.info(log.text`Impossible`);
            });
        });
        expect(result).toMatchSnapshot();
    });

    test("internal error in source at range", () => {
        const result = runServer((log) => {
            log.source("/foo/bar", "Hello, world", (log) => {
                log.at({ start: 3, end: 5 }).internal(log.text`OMG`);
                log.info(log.text`Impossible`);
            });
        });
        expect(result).toMatchSnapshot();
    });

    test("uncaught error", () => {
        const result = runServer(() => {
            throw new Error("Uncaught!");
        });
        expect(result).toMatchSnapshot();
    });

    test("uncaught error in source", () => {
        const result = runServer((log) => {
            return log.source("/foo/bar", "Hello, world", () => {
                throw new Error("hehe");
            });
        });
        expect(result).toMatchSnapshot();
    });

    test("multiple errors", () => {
        const result = runServer((log) => {
            log.recover((log) => {
                log.error(log.text`foo`);
                log.error(log.text`bar`);
            });
        });
        expect(result).toMatchSnapshot();
    });

    test("exit on error", () => {
        const result = runServer((log) => {
            log.recover((log) => {
                log.error(log.text`foo`);
                log.error(log.text`bar`);
                log.exitIfErrored();
            });
            log.error(log.text`impossible`);
        });
        expect(result).toMatchSnapshot();
    });

    test("multiple errors inside source", () => {
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
        expect(result).toMatchSnapshot();
    });

    test("source inside multiple errors", () => {
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
        expect(result).toMatchSnapshot();
    });

    test("typed errors", () => {
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
        expect(result).toMatchSnapshot();
    });

    test("typed errors for source", () => {
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
        expect(result).toMatchSnapshot();
    });
});
