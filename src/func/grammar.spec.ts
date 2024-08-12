import { FuncParseError, FuncSyntaxError, match, parseFile } from "./grammar";
import { loadCases } from "../utils/loadCases";

describe("FunC grammar and parser", () => {
    beforeEach(() => {});
    const ext = "fc";
    let matchedAll = true;

    // Checking that valid FunC files match the grammar
    for (const r of loadCases(__dirname + "/grammar-test/", ext)) {
        it(r.name + " should match the grammar", () => {
            const res = match(r.code);

            if (res.ok === false) {
                matchedAll = false;
                console.log(res.message, res.interval.getLineAndColumn());
            }

            expect(res.ok).toStrictEqual(true);
        });
    }

    // If didn't match the grammar, don't throw any more errors from full parse
    if (!matchedAll) {
        return;
    }

    // Checking that valid FunC files parse
    for (const r of loadCases(__dirname + "/grammar-test/", ext)) {
        it("should parse " + r.name, () => {
            let parsed: Object | undefined;
            try {
                parsed = parseFile(r.code, r.name + `.${ext}`);
            } finally {
                expect(parsed).not.toBe(undefined);
            }
        });
    }

    // Checking that invalid FunC files does NOT parse
    for (const r of loadCases(__dirname + "/grammar-test-failed/", ext)) {
        it("should NOT parse " + r.name, () => {
            expect(() =>
                parseFile(r.code, r.name + `.${ext}`),
            ).toThrowErrorMatchingSnapshot();
        });
    }
});
