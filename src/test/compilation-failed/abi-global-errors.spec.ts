import { __DANGER_resetNodeId } from "../../grammar/ast";
import { itShouldNotCompile } from "./util";

describe("abi/global.ts errors", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    itShouldNotCompile({
        testName: "sha256-expects-string-or-slice",
        errorMessage: "sha256 expects string or slice argument",
    });
});
