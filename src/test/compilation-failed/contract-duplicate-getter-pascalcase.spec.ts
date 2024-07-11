import { __DANGER_resetNodeId } from "../../grammar/ast";
import { itShouldNotCompile } from "./util";

describe("contract-duplicate-getter-pascalcase", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    itShouldNotCompile({
        testName: "contract-duplicate-getter-pascalcase",
        errorMessage:
            "Bindings compiler crashed: Getter with name 'test_getter' already exists in pascal case form",
    });
});
