import { catchUncolored, thenUncolored } from "./async-util";

describe("catchUncolored", () => {
    it("should return the result of a synchronous function when it does not throw an error", () => {
        const result = catchUncolored(
            () => 1,
            (e) => {
                throw new Error("Rethrow");
            },
        );
        expect(result).toBe(1);
    });

    it("should call onError callback when the synchronous function throws an error", () => {
        const onError = jest.fn((e) => "Handled");
        const result = catchUncolored(() => {
            throw new Error("Test Error");
        }, onError);
        expect(result).toBe("Handled");
        expect(onError).toHaveBeenCalledWith(expect.any(Error));
    });

    it("should return the result of an asynchronous function", async () => {
        const result = await catchUncolored(
            async () => 3,
            (e) => {
                throw new Error("Rethrow");
            },
        );
        expect(result).toBe(3);
    });

    it("should handle error in asynchronous function and return result from synchronous onError", async () => {
        const onError = jest.fn(() => "Handled");
        const result = await catchUncolored(async () => {
            throw new Error("Async Error");
        }, onError as any);
        expect(result).toBe("Handled");
        expect(onError).toHaveBeenCalledWith(expect.any(Error));
    });

    it("should handle error in asynchronous function and return result from asynchronous onError", async () => {
        const onError = jest.fn(async () => "Handled");
        const result = await catchUncolored(async () => {
            throw new Error("Async Error");
        }, onError);
        expect(result).toBe("Handled");
        expect(onError).toHaveBeenCalledWith(expect.any(Error));
    });

    it("should return result from synchronous onError when async function throws an error", async () => {
        const onError = jest.fn(() => "Handled");
        const result = await catchUncolored(async () => {
            throw new Error("Async Error");
        }, onError as any);
        expect(result).toBe("Handled");
        expect(onError).toHaveBeenCalledWith(expect.any(Error));
    });

    it("should return result from asynchronous onError when async function throws an error", async () => {
        const onError = jest.fn(async () => "Handled");
        const result = await catchUncolored(async () => {
            throw new Error("Async Error");
        }, onError);
        expect(result).toBe("Handled");
        expect(onError).toHaveBeenCalledWith(expect.any(Error));
    });
});

describe("thenUncolored", () => {
    it("should return the result of a synchronous function when function is passed", () => {
        const result = thenUncolored(3, () => 2);
        expect(result).toBe(2);
    });

    it("should return a Promise that resolves to the result when a Promise is passed", async () => {
        const result = thenUncolored(Promise.resolve(5), () => 2);
        await expect(result).resolves.toBe(2);
    });
});
