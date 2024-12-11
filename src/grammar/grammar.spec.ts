import { parse } from "./grammar";
import { SrcInfo, __DANGER_resetNodeId } from "./ast";
import { loadCases } from "../utils/loadCases";

expect.addSnapshotSerializer({
    test: (src) => src instanceof SrcInfo,
    print: (src) => (src as SrcInfo).contents,
});

describe("grammar", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    for (const r of loadCases(__dirname + "/test/")) {
        it("should parse " + r.name, () => {
            expect(parse(r.code, "<unknown>", "user")).toMatchSnapshot();
        });
    }

    for (const r of loadCases(__dirname + "/test-failed/")) {
        it("should fail " + r.name, () => {
            expect(() =>
                parse(r.code, "<unknown>", "user"),
            ).toThrowErrorMatchingSnapshot();
        });
    }
});
