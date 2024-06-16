import { __DANGER_resetNodeId } from "../../grammar/ast";
import { consoleLogger } from "../../logger";
import { itShouldNotCompile } from "./util";

describe("stdlib-bugs", () => {
    beforeAll(() => {
        jest.spyOn(consoleLogger, "error").mockImplementation(() => {});
        jest.spyOn(consoleLogger, "log").mockImplementation(() => {});
    });

    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    afterAll(() => {
        jest.restoreAllMocks();
    });

    afterEach(() => {
        jest.clearAllMocks();
    });

    itShouldNotCompile({
        testName: "stdlib-skipBits",
        errorMessage: 'Type mismatch: "<void>" is not assignable to "Slice"',
    });
});
