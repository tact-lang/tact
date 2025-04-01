import { itShouldNotCompile } from "@/test/compilation-failed/util";

describe("stdlib-bugs", () => {
    itShouldNotCompile({
        testName: "stdlib-skipBits",
        errorMessage: 'Type mismatch: "<void>" is not assignable to "Slice"',
    });
});
