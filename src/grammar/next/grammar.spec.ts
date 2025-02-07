import { getAstFactory } from "../../ast/ast-helpers";
import { loadCases } from "../../utils/loadCases";
import { getParser } from "./";
import { SrcInfo, isSrcInfo } from "../src-info";

expect.addSnapshotSerializer({
    test: (src) => isSrcInfo(src),
    print: (src) => (src as SrcInfo).contents,
});

describe("grammar", () => {
    const shouldParsePaths = [__dirname + "/../test/", __dirname + "/test/"];

    for (const path of shouldParsePaths) {
        for (const r of loadCases(path)) {
            it("should parse " + r.name, () => {
                const ast = getAstFactory();
                const { parse } = getParser(ast);
                expect(
                    parse({ code: r.code, path: "<unknown>", origin: "user" }),
                ).toMatchSnapshot();
            });
        }
    }

    for (const r of loadCases(__dirname + "/../test-failed/")) {
        it("should fail " + r.name, () => {
            const ast = getAstFactory();
            const { parse } = getParser(ast);
            expect(() =>
                parse({ code: r.code, path: "<unknown>", origin: "user" }),
            ).toThrowErrorMatchingSnapshot();
        });
    }
});

describe("parse imports", () => {
    const parser = getParser(getAstFactory());

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

    it("should parse step-up imports", () => {
        expect(parse('import "../import";')).toMatchObject({
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

    it("should parse deep imports", () => {
        expect(parse('import "./import/second";')).toMatchObject({
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

    it("should not add .tact second time", () => {
        expect(parse('import "./import.tact";')).toMatchObject({
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

    it("should detect .fc imports", () => {
        expect(parse('import "./import.fc";')).toMatchObject({
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

    it("should detect .func imports", () => {
        expect(parse('import "./import.func";')).toMatchObject({
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

    it("should parse absolute stdlib imports", () => {
        expect(parse('import "@stdlib/foo";')).toMatchObject({
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

    it("should parse relative stdlib imports", () => {
        expect(parse('import "@stdlib/foo/../bar";')).toMatchObject({
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

    it("should parse stdlib tact imports with extension", () => {
        expect(parse('import "@stdlib/foo.tact";')).toMatchObject({
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

    it("should parse stdlib func imports with extension", () => {
        expect(parse('import "@stdlib/foo.fc";')).toMatchObject({
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

    it("should reject stdlib root import", () => {
        expect(() => parse('import "@stdlib";')).toThrow();
    });

    it("should reject stdlib root import as folder", () => {
        expect(() => parse('import "@stdlib/";')).toThrow();
    });

    it("should reject stdlib folder import", () => {
        expect(() => parse('import "@stdlib/foo/";')).toThrow();
    });

    it("should reject stdlib import up from stdlib root", () => {
        expect(() => parse('import "@stdlib/../foo";')).toThrow();
    });
});

describe("parse type", () => {
    const parse = (s: string) => {
        try {
            return getParser(getAstFactory()).parseType(s);
        } catch (e) {
            return e;
        }
    };

    it("foo", () => {
        expect(parse("foo")).toMatchSnapshot();
    });
    it("Foo", () => {
        expect(parse("Foo")).toMatchSnapshot();
    });
    it("map", () => {
        expect(parse("map")).toMatchSnapshot();
    });
    it("map<>", () => {
        expect(parse("map<>")).toMatchSnapshot();
    });
    it("map<T>", () => {
        expect(parse("map<T>")).toMatchSnapshot();
    });
    it("map<T, U>", () => {
        expect(parse("map<T, U>")).toMatchSnapshot();
    });
    it("map<T, U, V>", () => {
        expect(parse("map<T, U, V>")).toMatchSnapshot();
    });
    it("bounced", () => {
        expect(parse("bounced")).toMatchSnapshot();
    });
    it("bounced<>", () => {
        expect(parse("bounced<>")).toMatchSnapshot();
    });
    it("bounced<T>", () => {
        expect(parse("bounced<T>")).toMatchSnapshot();
    });
    it("bounced<T, U>", () => {
        expect(parse("bounced<T, U>")).toMatchSnapshot();
    });
    it("foo<>", () => {
        expect(parse("foo<>")).toMatchSnapshot();
    });
    it("foo<T>", () => {
        expect(parse("foo<T>")).toMatchSnapshot();
    });
    it("Foo<T>", () => {
        expect(parse("Foo<T>")).toMatchSnapshot();
    });
    it("Foo<T, U>", () => {
        expect(parse("Foo<T, U>")).toMatchSnapshot();
    });
    it("Foo<\nT,\nU,\n>", () => {
        expect(parse("Foo<\nT,\nU,\n>")).toMatchSnapshot();
    });
    it("[]", () => {
        expect(parse("[]")).toMatchSnapshot();
    });
    it("[T]", () => {
        expect(parse("[T]")).toMatchSnapshot();
    });
    it("[T, U]", () => {
        expect(parse("[T, U]")).toMatchSnapshot();
    });
    it("[T, U,]", () => {
        expect(parse("[T, U,]")).toMatchSnapshot();
    });
    it("()", () => {
        expect(parse("()")).toMatchSnapshot();
    });
    it("(T)", () => {
        expect(parse("(T)")).toMatchSnapshot();
    });
    it("(T,)", () => {
        expect(parse("(T,)")).toMatchSnapshot();
    });
    it("(T, U)", () => {
        expect(parse("(T, U)")).toMatchSnapshot();
    });
    it("(T, U,)", () => {
        expect(parse("(T, U,)")).toMatchSnapshot();
    });
    it("T?", () => {
        expect(parse("T?")).toMatchSnapshot();
    });
    it("T??", () => {
        expect(parse("T??")).toMatchSnapshot();
    });
    it("(T?)?", () => {
        expect(parse("(T?)?")).toMatchSnapshot();
    });
    it("(T??)", () => {
        expect(parse("(T??)")).toMatchSnapshot();
    });
    it("T as U", () => {
        expect(parse("T as U")).toMatchSnapshot();
    });
    it("T as U as V", () => {
        expect(parse("T as U as V")).toMatchSnapshot();
    });
    it("(T as U) as V", () => {
        expect(parse("(T as U) as V")).toMatchSnapshot();
    });
    it("(T as U as V)", () => {
        expect(parse("(T as U as V)")).toMatchSnapshot();
    });
    it("T? as U", () => {
        expect(parse("T? as U")).toMatchSnapshot();
    });
    it("(T as U)?", () => {
        expect(parse("(T as U)?")).toMatchSnapshot();
    });
    it("((T as U)?)", () => {
        expect(parse("((T as U)?)")).toMatchSnapshot();
    });
    it("(T?) as U", () => {
        expect(parse("(T?) as U")).toMatchSnapshot();
    });
    it("((T?) as U)", () => {
        expect(parse("((T?) as U)")).toMatchSnapshot();
    });
});
