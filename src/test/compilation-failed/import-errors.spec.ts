import { __DANGER_resetNodeId } from "../../grammar/ast";
import { itShouldNotCompile } from "./util";

describe("import-errors", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    itShouldNotCompile({
        testName: "import-symlink",
        errorMessage:
            "is a symbolic link which are not processed by Tact to forbid out-of-project-root accesses via symlinks",
    });
});
