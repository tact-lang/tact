import { __DANGER_resetNodeId } from "../../grammar/ast";
import { run } from "../../node";
import { consoleLogger } from "../../logger";

describe("fail-implicit-init", () => {
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

    it("should not compile with uninitialized storage fields", async () => {
        const result = await run({
            configPath: __dirname + "/tact.config.json",
            projectNames: ["implicit-init"],
        });
        expect(result).toBe(false);
        expect((consoleLogger.error as jest.Mock).mock.lastCall[0]).toContain(
            'Field "test_field" is not set',
        );
    });
});
