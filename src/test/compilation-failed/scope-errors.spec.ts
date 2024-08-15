import { __DANGER_resetNodeId } from "../../grammar/ast";
import { itShouldNotCompile } from "./util";

describe("scope-errors", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    itShouldNotCompile({
        testName: "scope-const-shadows-stdlib-ident",
        errorMessage:
            'Constant "b" is shadowing an identifier defined in the Tact standard library: pick a different constant name',
    });
});
