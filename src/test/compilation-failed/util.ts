import { run } from "../../cli";

// helper to reduce boilerplate
export function itShouldNotCompile(params: {
    testName: string;
    errorMessage: string;
}) {
    it(`should not compile ${params.testName}`, async () => {
        const result = await run({
            configPath: __dirname + "/tact.config.json",
            projectNames: [params.testName],
            suppressLog: true,
        });
        expect(result.ok).toBe(false);
        const message = result.error.map((err) => err.message).join("; ");
        expect(message).toContain(params.errorMessage);
    });
}
