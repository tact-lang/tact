import { __DANGER_resetNodeId } from "../grammar/ast";
import { run } from "../node";
import { consoleLogger } from "../logger";

describe("feature-const-eval", () => {
    beforeAll(() => {
        jest.spyOn(consoleLogger, "error").mockImplementation(() => {});
    });

    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    afterAll(() => {
        (consoleLogger.error as jest.Mock).mockRestore();
    });

    afterEach(() => {
        (consoleLogger.error as jest.Mock).mockClear();
    });

    it("should not compile with division by zero", async () => {
        const result = await run({
            configPath: __dirname + "/test-tact.config.json",
            projectNames: ["const-eval"],
        });
        expect((consoleLogger.error as jest.Mock).mock.lastCall[0]).toContain(
            "Cannot divide by zero",
        );
        expect(result).toBe(false);
    });
});
