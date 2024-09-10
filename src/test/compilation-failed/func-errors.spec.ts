import { __DANGER_resetNodeId } from "../../grammar/ast";
import { itShouldNotCompile } from "./util";

describe("func-errors", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    itShouldNotCompile({
        testName: "func-function-does-not-exist",
        errorMessage:
            "Function 'iDoNotExist' does not exist in imported FunC sources",
    });
});
