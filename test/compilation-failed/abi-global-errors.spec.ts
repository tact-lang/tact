import { itShouldNotCompile } from "./util";

describe("abi/global.ts errors", () => {
    itShouldNotCompile({
        testName: "sha256-expects-string-or-slice",
        errorMessage: "sha256 expects string or slice argument",
    });
});
