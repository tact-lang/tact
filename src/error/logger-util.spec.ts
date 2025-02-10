import { TactInternalError } from "./errors";
import {
    _exit,
    _ExitError,
    handleTopLevelErrors,
    Logger,
    rethrowWithPath,
} from "./logger-util";

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

    it("should return result when no error is thrown", () => {
        const cb = jest.fn(() => "result");

        const result = handleTopLevelErrors(mockLogger, cb, exit);

        expect(result).toBe("result");
        expect(cb).toHaveBeenCalledTimes(1);
    });

    it("should handle _ExitError and call process.exit(30)", () => {
        const cb = jest.fn(() => {
            throw new _ExitError();
        });

        // Mock process.exit to throw an error that we can catch
        const exitSpy = jest
            .spyOn(process, "exit")
            .mockImplementation((code) => {
                throw new Error(`process.exit called with code ${code}`);
            });

        let caughtError: unknown | null = null;

        try {
            handleTopLevelErrors(mockLogger, cb, exit);
        } catch (error) {
            caughtError = error;
        }

        // Now we check the caught error at the top level of the test
        expect(caughtError).not.toBeNull();
        expect(caughtError).toMatchObject({
            message: "process.exit called with code 30",
        });
        expect(cb).toHaveBeenCalledTimes(1);

        exitSpy.mockRestore();
    });

    it("should handle TactInternalError and call process.exit(30)", () => {
        const internalError = new TactInternalError("Internal error");
        const cb = jest.fn(() => {
            throw internalError;
        });

        const exitSpy = jest
            .spyOn(process, "exit")
            .mockImplementation((code) => {
                throw new Error(`process.exit called with code ${code}`);
            });

        let caughtError: unknown | null = null;

        try {
            handleTopLevelErrors(mockLogger, cb, exit);
        } catch (error) {
            caughtError = error;
        }

        expect(caughtError).not.toBeNull();
        expect(caughtError).toMatchObject({
            message: "process.exit called with code 30",
        });
        expect(cb).toHaveBeenCalledTimes(1);

        exitSpy.mockRestore();
    });

    it("should handle general error and call process.exit(30)", () => {
        const generalError = new Error("General error");
        const cb = jest.fn(() => {
            throw generalError;
        });

        const exitSpy = jest
            .spyOn(process, "exit")
            .mockImplementation((code) => {
                throw new Error(`process.exit called with code ${code}`);
            });

        let caughtError: unknown | null = null;

        try {
            handleTopLevelErrors(mockLogger, cb, exit);
        } catch (error) {
            caughtError = error;
        }

        expect(caughtError).not.toBeNull();
        expect(caughtError).toMatchObject({
            message: "process.exit called with code 30",
        });
        expect(cb).toHaveBeenCalledTimes(1);

        exitSpy.mockRestore();
    });

    it("should handle Promise resolving with a value", async () => {
        const cb = jest.fn(() => Promise.resolve("resolved value"));

        const result = await handleTopLevelErrors(mockLogger, cb, exit);

        expect(result).toBe("resolved value");
        expect(cb).toHaveBeenCalledTimes(1);
        expect(mockLogger.internal).not.toHaveBeenCalled();
    });

    it("should handle Promise rejecting with _ExitError", async () => {
        const cb = jest.fn(() => Promise.reject(new _ExitError()));

        // Mock process.exit to throw an error that we can catch
        const exitSpy = jest
            .spyOn(process, "exit")
            .mockImplementation((code) => {
                throw new Error(`process.exit called with code ${code}`);
            });

        let caughtError: unknown | null = null;

        try {
            await handleTopLevelErrors(mockLogger, cb, exit);
        } catch (error) {
            caughtError = error;
        }

        // Now we check the caught error at the top level of the test
        expect(caughtError).not.toBeNull();
        expect(caughtError).toMatchObject({
            message: "process.exit called with code 30",
        });
        expect(cb).toHaveBeenCalledTimes(1);

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

        let caughtError: unknown | null = null;

        try {
            await handleTopLevelErrors(mockLogger, cb, exit);
        } catch (error) {
            caughtError = error;
        }

        expect(caughtError).not.toBeNull();
        expect(caughtError).toMatchObject({
            message: "process.exit called with code 30",
        });
        expect(cb).toHaveBeenCalledTimes(1);

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

        let caughtError: unknown | null = null;

        try {
            await handleTopLevelErrors(mockLogger, cb, exit);
        } catch (error) {
            caughtError = error;
        }

        expect(caughtError).not.toBeNull();
        expect(caughtError).toMatchObject({
            message: "process.exit called with code 30",
        });
        expect(cb).toHaveBeenCalledTimes(1);

        exitSpy.mockRestore();
    });
});

describe("rethrowWithPath", () => {
    it("should append path to TactInternalError message", () => {
        const error = new TactInternalError("Internal error");
        const path = "/some/path";

        expect(() => rethrowWithPath(error, path)).toThrow(
            new TactInternalError("Internal error\nwhile compiling /some/path"),
        );
    });

    it("should append path to general Error message", () => {
        const error = new Error("General error");
        const path = "/some/path";

        expect(() => rethrowWithPath(error, path)).toThrow(
            new Error("General error\nwhile compiling /some/path"),
        );
    });

    it("should not modify the error message for non-Error instances", () => {
        const error = "Some non-error string";
        const path = "/some/path";

        expect(() => rethrowWithPath(error, path)).toThrow(
            "Some non-error string",
        );
    });
});
