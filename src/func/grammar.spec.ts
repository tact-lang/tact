import { match } from "./grammar";
import { loadCases } from "../utils/loadCases";

describe("FunC grammar and parser", () => {
    beforeEach(() => {});

    // Checking that FunC files match the grammar
    for (const r of loadCases(__dirname + "/grammar-test/", "fc")) {
        // if (r.name !== "include_stdlib") continue;

        it(r.name + " should match the grammar", () => {
            expect(match(r.code).ok).toStrictEqual(true);
        });
    }

    // TODO: Tests with snapshots, once semantics and `parse` function are defined
});
