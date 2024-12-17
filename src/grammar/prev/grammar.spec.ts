import { AstModule, SrcInfo, __DANGER_resetNodeId } from "../ast";
import { loadCases } from "../../utils/loadCases";
import { getParser } from "./grammar";

expect.addSnapshotSerializer({
    test: (src) => src instanceof SrcInfo,
    print: (src) => (src as SrcInfo).contents,
});

describe("grammar", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    // Test parsing of known Fift projects, wrapped in asm functions of Tact
    for (const r of loadCases(__dirname + "/../test-asm/")) {
        it("should parse " + r.name, () => {
            const { parse } = getParser();
            const parsed: AstModule | undefined = parse(
                r.code,
                "<unknown>",
                "user",
            );

            // Don't produce snapshots
            expect(parsed).toBeDefined();
        });
    }

    for (const r of loadCases(__dirname + "/../test/")) {
        it("should parse " + r.name, () => {
            const { parse } = getParser();
            expect(parse(r.code, "<unknown>", "user")).toMatchSnapshot();
        });
    }

    for (const r of loadCases(__dirname + "/../test-failed/")) {
        it("should fail " + r.name, () => {
            const { parse } = getParser();
            expect(() =>
                parse(r.code, "<unknown>", "user"),
            ).toThrowErrorMatchingSnapshot();
        });
    }
});
