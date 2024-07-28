import { match } from "./grammar";
import { loadCases } from "../utils/loadCases";

describe("FunC grammar and parser", () => {
    beforeEach(() => {});

    const target = "asm-functions";
    // const target = "identifiers";

    // Checking that FunC files match the grammar
    for (const r of loadCases(__dirname + "/grammar-test/", "fc")) {
        if (r.name !== target) continue;
        it(r.name + " should match the grammar", () => {
            const res = match(r.code);

            if (res.ok === false) {
                console.log(res.message, res.interval.getLineAndColumn());
            }

            expect(res.ok).toStrictEqual(true);
        });
    }

    // Checking that certain FunC files DON'T match the grammar
    for (const r of loadCases(__dirname + "/grammar-test-failed/", "fc")) {
        it(r.name + " should not match the grammar", () => {
            expect(match(r.code).ok).toStrictEqual(false);
        });
    }

    // TODO: Tests with snapshots, once semantics and `parse` function are defined
});
