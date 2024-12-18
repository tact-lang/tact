import { itShouldNotCompile } from "./util";

describe("func-errors", () => {
    itShouldNotCompile({
        testName: "func-function-does-not-exist",
        errorMessage:
            "Function 'iDoNotExist' does not exist in imported FunC sources",
    });
});
