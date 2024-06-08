import { __DANGER_resetNodeId } from "../../grammar/ast";
import { run } from "../../node";
import { consoleLogger } from "../../logger";

describe("fail-const-eval", () => {
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
            configPath: __dirname + "/tact.config.json",
            projectNames: ["const-eval"],
        });
        expect(result).toBe(false);
        expect((consoleLogger.error as jest.Mock).mock.lastCall[0]).toContain(
            "Cannot divide by zero",
        );
    });

    it("should not compile with invalid address", async () => {
        const result = await run({
            configPath: __dirname + "/tact.config.json",
            projectNames: ["invalid-address"],
        });
        expect(result).toBe(false);
        expect((consoleLogger.error as jest.Mock).mock.lastCall[0]).toContain(
            "FQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N is not a valid address",
        );
    });
});
