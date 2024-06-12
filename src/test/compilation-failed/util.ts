import { run } from "../../node";
import { consoleLogger } from "../../logger";

// helper to reduce boilerplate
export function itShouldNotCompile(params: {
    testName: string;
    errorMessage: string;
}) {
    it(`should not compile ${params.testName}`, async () => {
        const result = await run({
            configPath: __dirname + "/tact.config.json",
            projectNames: [`${params.testName}`],
        });
        expect(result).toBe(false);
        expect((consoleLogger.error as jest.Mock).mock.lastCall[0]).toContain(
            params.errorMessage,
        );
    });
}
