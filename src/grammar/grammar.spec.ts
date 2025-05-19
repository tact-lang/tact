import { getAstFactory } from "@/ast/ast-helpers";
import { loadCases } from "@/utils/loadCases.infra";
import type { SrcInfo } from "@/grammar/src-info";
import { isSrcInfo } from "@/grammar/src-info";
import { getParser } from "@/grammar/index";
import { step, attachment } from "@/test/allure/allure";
import { ContentType } from "allure-js-commons";

expect.addSnapshotSerializer({
    test: (src) => isSrcInfo(src),
    print: (src) => (src as SrcInfo).contents,
});

for (const r of loadCases(__dirname + "/test/")) {
    const isNeg = r.name.endsWith(".fail");
    it("should " + (isNeg ? "fail" : "parse") + " " + r.name, async () => {
        await attachment("Code", r.code, ContentType.TEXT);
        const ast = getAstFactory();
        const { parse } = getParser(ast);
        if (isNeg) {
            await step("Parse should fail and match snapshot", () => {
                expect(() =>
                    parse({ code: r.code, path: "<unknown>", origin: "user" }),
                ).toThrowErrorMatchingSnapshot();
            });
        } else {
            await step("Parse output should match snapshot", () => {
                expect(
                    parse({ code: r.code, path: "<unknown>", origin: "user" }),
                ).toMatchSnapshot();
            });
        }
    });
}

describe("parse imports", () => {
    const parser = getParser(getAstFactory());

    const parse = (code: string) => {
        return parser.parse({
            code,
            origin: "user",
            path: "test/test.tact",
        });
    };

    it("should reject non-relative imports", async () => {
        await step("Should reject non-relative imports", () => {
            expect(() => parse('import "some_name";')).toThrow();
        });
    });

    it("should reject folder imports", async () => {
        await step("Should reject folder imports", () => {
            expect(() => parse('import "./some_name/";')).toThrow();
        });
    });

    it("should reject windows imports", async () => {
        await step("Should reject windows imports", () => {
            expect(() => parse('import ".\\some_name";')).toThrow();
        });
    });

    it("should parse relative imports", async () => {
        const result = parse('import "./import";');
        await step("Should parse relative imports", () => {
            expect(result).toMatchObject({
                imports: [
                    {
                        importPath: {
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
    });

    it("should parse step-up imports", async () => {
        const result = parse('import "../import";');
        await step("Should parse step-up imports", () => {
            expect(result).toMatchObject({
                imports: [
                    {
                        importPath: {
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
    });

    it("should parse deep imports", async () => {
        const result = parse('import "./import/second";');
        await step("Should parse deep imports", () => {
            expect(result).toMatchObject({
                imports: [
                    {
                        importPath: {
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
    });

    it("should not add .tact second time", async () => {
        const result = parse('import "./import.tact";');
        await step("Should not add .tact second time", () => {
            expect(result).toMatchObject({
                imports: [
                    {
                        importPath: {
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
    });

    it("should detect .fc imports", async () => {
        const result = parse('import "./import.fc";');
        await step("Should detect .fc imports", () => {
            expect(result).toMatchObject({
                imports: [
                    {
                        importPath: {
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

    it("should detect .func imports", async () => {
        const result = parse('import "./import.func";');
        await step("Should detect .func imports", () => {
            expect(result).toMatchObject({
                imports: [
                    {
                        importPath: {
                            type: "relative",
                            language: "func",
                            path: {
                                segments: ["import.func"],
                                stepsUp: 0,
                            },
                        },
                    },
                ],
            });
        });
    });

    it("should parse absolute stdlib imports", async () => {
        const result = parse('import "@stdlib/foo";');
        await step("Should parse absolute stdlib imports", () => {
            expect(result).toMatchObject({
                imports: [
                    {
                        importPath: {
                            type: "stdlib",
                            language: "tact",
                            path: {
                                segments: ["foo.tact"],
                                stepsUp: 0,
                            },
                        },
                    },
                ],
            });
        });
    });

    it("should parse relative stdlib imports", async () => {
        const result = parse('import "@stdlib/foo/../bar";');
        await step("Should parse relative stdlib imports", () => {
            expect(result).toMatchObject({
                imports: [
                    {
                        importPath: {
                            type: "stdlib",
                            language: "tact",
                            path: {
                                segments: ["bar.tact"],
                                stepsUp: 0,
                            },
                        },
                    },
                ],
            });
        });
    });

    it("should parse stdlib tact imports with extension", async () => {
        const result = parse('import "@stdlib/foo.tact";');
        await step("Should parse stdlib tact imports with extension", () => {
            expect(result).toMatchObject({
                imports: [
                    {
                        importPath: {
                            type: "stdlib",
                            language: "tact",
                            path: {
                                segments: ["foo.tact"],
                                stepsUp: 0,
                            },
                        },
                    },
                ],
            });
        });
    });

    it("should parse stdlib func imports with extension", async () => {
        const result = parse('import "@stdlib/foo.fc";');
        await step("Should parse stdlib func imports with extension", () => {
            expect(result).toMatchObject({
                imports: [
                    {
                        importPath: {
                            type: "stdlib",
                            language: "func",
                            path: {
                                segments: ["foo.fc"],
                                stepsUp: 0,
                            },
                        },
                    },
                ],
            });
        });
    });

    it("should reject stdlib root import", async () => {
        await step("Should reject stdlib root import", () => {
            expect(() => parse('import "@stdlib";')).toThrow();
        });
    });

    it("should reject stdlib root import as folder", async () => {
        await step("Should reject stdlib root import as folder", () => {
            expect(() => parse('import "@stdlib/";')).toThrow();
        });
    });

    it("should reject stdlib folder import", async () => {
        await step("Should reject stdlib folder import", () => {
            expect(() => parse('import "@stdlib/foo/";')).toThrow();
        });
    });

    it("should reject stdlib import up from stdlib root", async () => {
        await step("Should reject stdlib import up from stdlib root", () => {
            expect(() => parse('import "@stdlib/../foo";')).toThrow();
        });
    });
});
