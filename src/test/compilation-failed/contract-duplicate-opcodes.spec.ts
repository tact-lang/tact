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
        testName: "contract-duplicate-bounced-opcode",
        errorMessage:
            'Receive functions of a contract or trait cannot process messages with the same opcode: opcodes of message types "Msg2" and "Msg1" are equal',
    });
    itShouldNotCompile({
        testName: "contract-duplicate-external-opcode",
        errorMessage:
            'Receive functions of a contract or trait cannot process messages with the same opcode: opcodes of message types "Msg2" and "Msg1" are equal',
    });
    itShouldNotCompile({
        testName: "contract-duplicate-receiver-opcode",
        errorMessage:
            'Receive functions of a contract or trait cannot process messages with the same opcode: opcodes of message types "Msg2" and "Msg1" are equal',
    });
});
