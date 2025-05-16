import { getAstFactory } from "@/ast/ast-helpers";
import { resolveDescriptors } from "@/types/resolveDescriptors";
import { WriterContext } from "@/generator/Writer";
import { resolveFuncType } from "@/generator/writers/resolveFuncType";
import { openContext, parseModules } from "@/context/store";
import { CompilerContext } from "@/context/context";
import { getParser } from "@/grammar";
import type { Source } from "@/imports/source";
import { attachment, step } from "@/test/allure/allure";
import { ContentType } from "allure-js-commons";

const primitiveCode = `
primitive Int;
primitive Bool;
primitive Builder;
primitive Cell;
primitive Slice;

trait BaseTrait {

}

struct Struct1 {
    a1: Int;
    a2: Int;
}

struct Struct2 {
    b1: Int;
}

contract Contract1 {
    c: Int;
    c2: Int;

    init() {

    }
}

contract Contract2 {
    d: Int;
    e: Struct1;

    init() {

    }
}
`;

describe("resolveFuncType", () => {
    it("should process primitive types", async () => {
        const ast = getAstFactory();
        const sources: Source[] = [
            { code: primitiveCode, path: "<unknown>", origin: "user" },
        ];
        await attachment("Code", primitiveCode, ContentType.TEXT);
        let ctx = openContext(
            new CompilerContext(),
            sources,
            [],
            parseModules(sources, getParser(ast)),
        );
        ctx = resolveDescriptors(ctx, ast);
        const wCtx = new WriterContext(ctx, "Contract1");
        await step("Int should resolve to int", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Int", optional: false },
                    wCtx,
                ),
            ).toBe("int");
        });
        await step("Bool should resolve to int", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Bool", optional: false },
                    wCtx,
                ),
            ).toBe("int");
        });
        await step("Cell should resolve to cell", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Cell", optional: false },
                    wCtx,
                ),
            ).toBe("cell");
        });
        await step("Slice should resolve to slice", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Slice", optional: false },
                    wCtx,
                ),
            ).toBe("slice");
        });
        await step("Builder should resolve to builder", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Builder", optional: false },
                    wCtx,
                ),
            ).toBe("builder");
        });
        await step("Optional Int should resolve to int", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Int", optional: true },
                    wCtx,
                ),
            ).toBe("int");
        });
        await step("Optional Bool should resolve to int", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Bool", optional: true },
                    wCtx,
                ),
            ).toBe("int");
        });
        await step("Optional Cell should resolve to cell", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Cell", optional: true },
                    wCtx,
                ),
            ).toBe("cell");
        });
        await step("Optional Slice should resolve to slice", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Slice", optional: true },
                    wCtx,
                ),
            ).toBe("slice");
        });
        await step("Optional Builder should resolve to builder", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Builder", optional: true },
                    wCtx,
                ),
            ).toBe("builder");
        });
    });

    it("should process contract and struct types", async () => {
        const ast = getAstFactory();
        const sources: Source[] = [
            { code: primitiveCode, path: "<unknown>", origin: "user" },
        ];
        await attachment("Code", primitiveCode, ContentType.TEXT);
        let ctx = openContext(
            new CompilerContext(),
            sources,
            [],
            parseModules(sources, getParser(ast)),
        );
        ctx = resolveDescriptors(ctx, ast);
        const wCtx = new WriterContext(ctx, "Contract1");
        await step("Struct1 should resolve to (int, int)", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Struct1", optional: false },
                    wCtx,
                ),
            ).toBe("(int, int)");
        });
        await step("Struct2 should resolve to (int)", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Struct2", optional: false },
                    wCtx,
                ),
            ).toBe("(int)");
        });
        await step("Contract1 should resolve to (int, int)", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Contract1", optional: false },
                    wCtx,
                ),
            ).toBe("(int, int)");
        });
        await step("Contract2 should resolve to (int, (int, int))", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Contract2", optional: false },
                    wCtx,
                ),
            ).toBe("(int, (int, int))");
        });
        await step("Optional Struct1 should resolve to tuple", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Struct1", optional: true },
                    wCtx,
                ),
            ).toBe("tuple");
        });
        await step("Optional Struct2 should resolve to tuple", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Struct2", optional: true },
                    wCtx,
                ),
            ).toBe("tuple");
        });
        await step("Optional Contract1 should resolve to tuple", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Contract1", optional: true },
                    wCtx,
                ),
            ).toBe("tuple");
        });
        await step("Optional Contract2 should resolve to tuple", () => {
            expect(
                resolveFuncType(
                    { kind: "ref", name: "Contract2", optional: true },
                    wCtx,
                ),
            ).toBe("tuple");
        });
    });
});
