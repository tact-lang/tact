import { __DANGER_resetNodeId } from "../../grammar/ast";
import { itShouldNotCompile } from "./util";

describe("stdlib-bugs", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    itShouldNotCompile({
        testName: "stdlib-skipBits",
        errorMessage: 'Type mismatch: "<void>" is not assignable to "Slice"',
    });
});
