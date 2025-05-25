import { itShouldNotCompile } from "@/test/compilation-failed/util";

describe("throw-errors", () => {
    itShouldNotCompile({
        testName: "throw-in-fallback-receiver",
        errorMessage:
            'Invalid exit code for "throw": 57896044618658097711785492504343953926634992332820282019728792003956564819968, but it must be in range [0, 65535]',
    });
});
