import { catchUncolored, thenUncolored } from "@/error/async-util";
import { step } from "@/test/allure/allure";

describe("catchUncolored", () => {
    it("should return the result of a synchronous function when it does not throw an error", async () => {
        const result = catchUncolored(
            () => 1,
            () => {
                throw new Error("Rethrow");
            },
        );
        await step("Result should be 1", () => {
            expect(result).toBe(1);
        });
    });

    it("should call onError callback when the synchronous function throws an error", async () => {
        const onError = jest.fn(() => "Handled");
        const result = catchUncolored(() => {
            throw new Error("Test Error");
        }, onError);
        await step("Result should be 'Handled'", () => {
            expect(result).toBe("Handled");
        });
        await step("onError should be called with Error", () => {
            expect(onError).toHaveBeenCalledWith(expect.any(Error));
        });
    });

    it("should return the result of an asynchronous function", async () => {
        const result = await catchUncolored(
            () => Promise.resolve(3),
            () => {
                throw new Error("Rethrow");
            },
        );
        await step("Result should be 3", () => {
            expect(result).toBe(3);
        });
    });

    it("should handle error in asynchronous function and return result from synchronous onError", async () => {
        const onError = jest.fn(() => "Handled");
        // eslint-disable-next-line @typescript-eslint/require-await
        const result = await catchUncolored(async () => {
            throw new Error("Async Error");
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
        }, onError as any);
        await step("Result should be 'Handled'", () => {
            expect(result).toBe("Handled");
        });
        await step("onError should be called with Error", () => {
            expect(onError).toHaveBeenCalledWith(expect.any(Error));
        });
    });

    it("should handle error in asynchronous function and return result from asynchronous onError", async () => {
        // eslint-disable-next-line @typescript-eslint/require-await
        const onError = jest.fn(async () => "Handled");
        // eslint-disable-next-line @typescript-eslint/require-await
        const result = await catchUncolored(async () => {
            throw new Error("Async Error");
        }, onError);
        await step("Result should be 'Handled'", () => {
            expect(result).toBe("Handled");
        });
        await step("onError should be called with Error", () => {
            expect(onError).toHaveBeenCalledWith(expect.any(Error));
        });
    });

    it("should return result from synchronous onError when async function throws an error", async () => {
        const onError = jest.fn(() => "Handled");
        // eslint-disable-next-line @typescript-eslint/require-await
        const result = await catchUncolored(async () => {
            throw new Error("Async Error");
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
        }, onError as any);
        await step("Result should be 'Handled'", () => {
            expect(result).toBe("Handled");
        });
        await step("onError should be called with Error", () => {
            expect(onError).toHaveBeenCalledWith(expect.any(Error));
        });
    });

    it("should return result from asynchronous onError when async function throws an error", async () => {
        // eslint-disable-next-line @typescript-eslint/require-await
        const onError = jest.fn(async () => "Handled");
        // eslint-disable-next-line @typescript-eslint/require-await
        const result = await catchUncolored(async () => {
            throw new Error("Async Error");
        }, onError);
        await step("Result should be 'Handled'", () => {
            expect(result).toBe("Handled");
        });
        await step("onError should be called with Error", () => {
            expect(onError).toHaveBeenCalledWith(expect.any(Error));
        });
    });
});

describe("thenUncolored", () => {
    it("should return the result of a synchronous function when function is passed", async () => {
        const result = thenUncolored(3, () => 2);
        await step("Result should be 2", () => {
            expect(result).toBe(2);
        });
    });

    it("should return a Promise that resolves to the result when a Promise is passed", async () => {
        const result = thenUncolored(Promise.resolve(5), () => 2);
        await step("Promise result should resolve to 2", async () => {
            await expect(result).resolves.toBe(2);
        });
    });
});
