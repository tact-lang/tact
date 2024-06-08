import { __DANGER_resetNodeId } from "../../grammar/ast";
import { run } from "../../node";
import { consoleLogger } from "../../logger";

describe("fail-bugs", () => {
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

    it("should not compile issue 349", async () => {
        const result = await run({
            configPath: __dirname + "/tact.config.json",
            projectNames: ["issue349"],
        });
        expect(result).toBe(false);
        expect((consoleLogger.error as jest.Mock).mock.lastCall[0]).toContain(
            'Type mismatch: "<void>" is not assignable to "Slice"',
        );
    });
});
