import { __DANGER_resetNodeId } from "../../grammar/ast";
import { consoleLogger } from "../../logger";
import { itShouldNotCompile } from "./util";

describe("stdlib-bugs", () => {
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

    itShouldNotCompile({
        testName: "stdlib-skipBits",
        errorMessage: 'Type mismatch: "<void>" is not assignable to "Slice"',
    });
});
