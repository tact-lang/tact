import { __DANGER_resetNodeId } from "../../grammar/ast";
import { itShouldNotCompile } from "./util";

describe("contract-duplicate-opcodes", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
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
