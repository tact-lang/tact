import { getAstFactory } from "../../ast/ast-helpers";
import { loadCases } from "../../utils/loadCases";
import { getParser } from "../grammar";
import { SrcInfo, isSrcInfo } from "../src-info";

expect.addSnapshotSerializer({
    test: (src) => isSrcInfo(src),
    print: (src) => (src as SrcInfo).contents,
});

describe("grammar", () => {
    for (const r of loadCases(__dirname + "/../test/")) {
        it("should parse " + r.name, () => {
            const ast = getAstFactory();
            const { parse } = getParser(ast, "old");
            expect(
                parse({ code: r.code, path: "<unknown>", origin: "user" }),
            ).toMatchSnapshot();
        });
    }

    for (const r of loadCases(__dirname + "/../test-failed/")) {
        it("should fail " + r.name, () => {
            const ast = getAstFactory();
            const { parse } = getParser(ast, "old");
            expect(() =>
                parse({ code: r.code, path: "<unknown>", origin: "user" }),
            ).toThrowErrorMatchingSnapshot();
        });
    }
});

describe("parse imports", () => {
    const parser = getParser(getAstFactory(), "old");

    const parse = (code: string) => {
        return parser.parse({
            code,
            origin: "user",
            path: "test/test.tact",
        });
    };

    it("should reject non-relative imports", () => {
        expect(() => parse('import "some_name";')).toThrow();
    });

    it("should reject folder imports", () => {
        expect(() => parse('import "./some_name/";')).toThrow();
    });

    it("should reject windows imports", () => {
        expect(() => parse('import ".\\some_name";')).toThrow();
    });

    it("should parse relative imports", () => {
        expect(parse('import "./import";')).toMatchObject({
            imports: [
                {
                    source: {
                        type: "relative",
                        language: "tact",
                        path: {
                            segments: ["import.tact"],
                            stepsUp: 0,
                        },
                    },
                },
            ],
        });
    });

    it("should parse step-up imports", () => {
        expect(parse('import "../import";')).toMatchObject({
            imports: [
                {
                    source: {
                        type: "relative",
                        language: "tact",
                        path: {
                            segments: ["import.tact"],
                            stepsUp: 1,
                        },
                    },
                },
            ],
        });
    });

    it("should parse deep imports", () => {
        expect(parse('import "./import/second";')).toMatchObject({
            imports: [
                {
                    source: {
                        type: "relative",
                        language: "tact",
                        path: {
                            segments: ["import", "second.tact"],
                            stepsUp: 0,
                        },
                    },
                },
            ],
        });
    });

    it("should not add .tact second time", () => {
        expect(parse('import "./import.tact";')).toMatchObject({
            imports: [
                {
                    source: {
                        type: "relative",
                        language: "tact",
                        path: {
                            segments: ["import.tact"],
                            stepsUp: 0,
                        },
                    },
                },
            ],
        });
    });

    it("should detect .fc imports", () => {
        expect(parse('import "./import.fc";')).toMatchObject({
            imports: [
                {
                    source: {
                        type: "relative",
                        language: "func",
                        path: {
                            segments: ["import.fc"],
                            stepsUp: 0,
                        },
                    },
                },
            ],
        });
    });
});
