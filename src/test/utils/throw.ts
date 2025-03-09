import { GetMethodError } from "@ton/sandbox";

export const shouldThrowOnTvmGetMethod = async (
    f: () => Promise<void>,
    expectedExitCode: number,
) => {
    try {
        await f();

        // It should not reach here
        expect(false).toBe(true);
    } catch (tvmError) {
        if (tvmError instanceof GetMethodError) {
            expect(tvmError.exitCode).toBe(expectedExitCode);
        } else {
            throw tvmError; // Rethrow any other errors
        }
    }
};
