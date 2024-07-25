import { match } from "./grammar";
import { loadCases } from "../utils/loadCases";

describe("FunC parser", () => {
    beforeEach(() => {});

    // Checking that FunC files match with the grammar
    for (const r of loadCases(__dirname + "/test/")) {
        it(r.name + " should match with the grammar", () => {
            expect(match(r.code).ok).toStrictEqual(true);
        });
    }

    // TODO: Tests with snapshots, once semantics and `parse` function are defined
});
