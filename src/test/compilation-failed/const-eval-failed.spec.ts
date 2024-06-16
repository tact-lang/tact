import { __DANGER_resetNodeId } from "../../grammar/ast";
import { consoleLogger } from "../../logger";
import { itShouldNotCompile } from "./util";

describe("fail-const-eval", () => {
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
        testName: "const-eval-div-by-zero",
        errorMessage: "Cannot divide by zero",
    });
    itShouldNotCompile({
        testName: "const-eval-invalid-address",
        errorMessage:
            "FQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N is not a valid address",
    });
});
