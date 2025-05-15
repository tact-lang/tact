import { TactInternalError } from "@/error/errors";
import type { Logger } from "@/error/logger-util";
import {
    _exit,
    _ExitError,
    handleTopLevelErrors,
    rethrowWithPath,
} from "@/error/logger-util";
import { step } from "@/test/allure/allure";

describe("handleTopLevelErrors", () => {
    const mockLogger = {
        internal: jest.fn(() => {
            throw new _ExitError();
        }),
        text: jest.fn().mockReturnValue("mock text"),
    } as unknown as Logger<string, unknown>;

    const exit = () => process.exit(30);

    beforeEach(() => {
        jest.clearAllMocks();
    });

    it("should return result when no error is thrown", async () => {
        const cb = jest.fn(() => "result");

        const result = handleTopLevelErrors(mockLogger, cb, exit);

        await step("Result should equal 'result'", () => {
            expect(result).toBe("result");
        });
        await step("Callback should be called once", () => {
            expect(cb).toHaveBeenCalledTimes(1);
        });
    });

    it("should handle _ExitError and call process.exit(30)", async () => {
        const cb = jest.fn(() => {
            throw new _ExitError();
        });

        // Mock process.exit to throw an error that we can catch
        const exitSpy = jest
            .spyOn(process, "exit")
            .mockImplementation((code) => {
                throw new Error(`process.exit called with code ${code}`);
            });

        let caughtError: unknown = null;

        try {
            handleTopLevelErrors(mockLogger, cb, exit);
        } catch (error) {
            caughtError = error;
        }

        await step("Error should be caught", () => {
            expect(caughtError).not.toBeNull();
        });
        await step("Caught error message should include exit code 30", () => {
            expect(caughtError).toMatchObject({
                message: "process.exit called with code 30",
            });
        });
        await step("Callback should be called once", () => {
            expect(cb).toHaveBeenCalledTimes(1);
        });

        exitSpy.mockRestore();
    });

    it("should handle TactInternalError and call process.exit(30)", async () => {
        const internalError = new TactInternalError("Internal error");
        const cb = jest.fn(() => {
            throw internalError;
        });

        const exitSpy = jest
            .spyOn(process, "exit")
            .mockImplementation((code) => {
                throw new Error(`process.exit called with code ${code}`);
            });

        let caughtError: unknown = null;

        try {
            handleTopLevelErrors(mockLogger, cb, exit);
        } catch (error) {
            caughtError = error;
        }

        await step("Error should be caught", () => {
            expect(caughtError).not.toBeNull();
        });
        await step("Caught error message should include exit code 30", () => {
            expect(caughtError).toMatchObject({
                message: "process.exit called with code 30",
            });
        });
        await step("Callback should be called once", () => {
            expect(cb).toHaveBeenCalledTimes(1);
        });

        exitSpy.mockRestore();
    });

    it("should handle general error and call process.exit(30)", async () => {
        const generalError = new Error("General error");
        const cb = jest.fn(() => {
            throw generalError;
        });

        const exitSpy = jest
            .spyOn(process, "exit")
            .mockImplementation((code) => {
                throw new Error(`process.exit called with code ${code}`);
            });

        let caughtError: unknown = null;

        try {
            handleTopLevelErrors(mockLogger, cb, exit);
        } catch (error) {
            caughtError = error;
        }

        await step("Error should be caught", () => {
            expect(caughtError).not.toBeNull();
        });
        await step("Caught error message should include exit code 30", () => {
            expect(caughtError).toMatchObject({
                message: "process.exit called with code 30",
            });
        });
        await step("Callback should be called once", () => {
            expect(cb).toHaveBeenCalledTimes(1);
        });

        exitSpy.mockRestore();
    });

    it("should handle Promise resolving with a value", async () => {
        const cb = jest.fn(() => Promise.resolve("resolved value"));

        const result = await handleTopLevelErrors(mockLogger, cb, exit);

        await step("Promise result should equal 'resolved value'", () => {
            expect(result).toBe("resolved value");
        });
        await step("Callback should be called once", () => {
            expect(cb).toHaveBeenCalledTimes(1);
        });
        await step("Logger.internal should not be called", () => {
            expect(mockLogger.internal).not.toHaveBeenCalled();
        });
    });

    it("should handle Promise rejecting with _ExitError", async () => {
        const cb = jest.fn(() => Promise.reject(new _ExitError()));

        // Mock process.exit to throw an error that we can catch
        const exitSpy = jest
            .spyOn(process, "exit")
            .mockImplementation((code) => {
                throw new Error(`process.exit called with code ${code}`);
            });

        let caughtError: unknown = null;

        try {
            await handleTopLevelErrors(mockLogger, cb, exit);
        } catch (error) {
            caughtError = error;
        }

        await step("Error should be caught", () => {
            expect(caughtError).not.toBeNull();
        });
        await step("Caught error message should include exit code 30", () => {
            expect(caughtError).toMatchObject({
                message: "process.exit called with code 30",
            });
        });
        await step("Callback should be called once", () => {
            expect(cb).toHaveBeenCalledTimes(1);
        });

        exitSpy.mockRestore();
    });

    it("should handle Promise rejecting with TactInternalError and call process.exit(30)", async () => {
        const internalError = new TactInternalError("Internal error");
        const cb = jest.fn(() => Promise.reject(internalError));

        const exitSpy = jest
            .spyOn(process, "exit")
            .mockImplementation((code) => {
                throw new Error(`process.exit called with code ${code}`);
            });

        let caughtError: unknown = null;

        try {
            await handleTopLevelErrors(mockLogger, cb, exit);
        } catch (error) {
            caughtError = error;
        }

        await step("Error should be caught", () => {
            expect(caughtError).not.toBeNull();
        });
        await step("Caught error message should include exit code 30", () => {
            expect(caughtError).toMatchObject({
                message: "process.exit called with code 30",
            });
        });
        await step("Callback should be called once", () => {
            expect(cb).toHaveBeenCalledTimes(1);
        });

        exitSpy.mockRestore();
    });

    it("should handle Promise rejecting with a general error and call process.exit(30)", async () => {
        const generalError = new Error("General error");
        const cb = jest.fn(() => Promise.reject(generalError));

        const exitSpy = jest
            .spyOn(process, "exit")
            .mockImplementation((code) => {
                throw new Error(`process.exit called with code ${code}`);
            });

        let caughtError: unknown = null;

        try {
            await handleTopLevelErrors(mockLogger, cb, exit);
        } catch (error) {
            caughtError = error;
        }

        await step("Error should be caught", () => {
            expect(caughtError).not.toBeNull();
        });
        await step("Caught error message should include exit code 30", () => {
            expect(caughtError).toMatchObject({
                message: "process.exit called with code 30",
            });
        });
        await step("Callback should be called once", () => {
            expect(cb).toHaveBeenCalledTimes(1);
        });

        exitSpy.mockRestore();
    });
});

describe("rethrowWithPath", () => {
    it("should append path to TactInternalError message", async () => {
        const error = new TactInternalError("Internal error");
        const path = "/some/path";

        await step("Throws TactInternalError with appended path", () => {
            expect(() => rethrowWithPath(error, path)).toThrow(
                new TactInternalError(
                    "Internal error\nwhile compiling /some/path",
                ),
            );
        });
    });

    it("should append path to general Error message", async () => {
        const error = new Error("General error");
        const path = "/some/path";

        await step("Throws Error with appended path", () => {
            expect(() => rethrowWithPath(error, path)).toThrow(
                new Error("General error\nwhile compiling /some/path"),
            );
        });
    });

    it("should not modify the error message for non-Error instances", async () => {
        const error = "Some non-error string";
        const path = "/some/path";

        await step("Throws original non-error value", () => {
            expect(() => rethrowWithPath(error, path)).toThrow(
                "Some non-error string",
            );
        });
    });
});
