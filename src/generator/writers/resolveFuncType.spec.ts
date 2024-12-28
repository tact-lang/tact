import { getAstFactory } from "../../grammar/ast";
import { resolveDescriptors } from "../../types/resolveDescriptors";
import { WriterContext } from "../Writer";
import { resolveFuncType } from "./resolveFuncType";
import { openContext } from "../../grammar/store";
import { CompilerContext } from "../../context";
import { getParser } from "../../grammar";
import { defaultParser } from "../../grammar/grammar";

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
    it("should process primitive types", () => {
        const ast = getAstFactory();
        let ctx = openContext(
            new CompilerContext(),
            [{ code: primitiveCode, path: "<unknown>", origin: "user" }],
            [],
            getParser(ast, defaultParser),
        );
        ctx = resolveDescriptors(ctx, ast);
        const wCtx = new WriterContext(ctx, "Contract1");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Int", optional: false },
                wCtx,
            ),
        ).toBe("int");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Bool", optional: false },
                wCtx,
            ),
        ).toBe("int");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Cell", optional: false },
                wCtx,
            ),
        ).toBe("cell");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Slice", optional: false },
                wCtx,
            ),
        ).toBe("slice");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Builder", optional: false },
                wCtx,
            ),
        ).toBe("builder");
        expect(
            resolveFuncType({ kind: "ref", name: "Int", optional: true }, wCtx),
        ).toBe("int");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Bool", optional: true },
                wCtx,
            ),
        ).toBe("int");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Cell", optional: true },
                wCtx,
            ),
        ).toBe("cell");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Slice", optional: true },
                wCtx,
            ),
        ).toBe("slice");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Builder", optional: true },
                wCtx,
            ),
        ).toBe("builder");
    });

    it("should process contract and struct types", () => {
        const ast = getAstFactory();
        let ctx = openContext(
            new CompilerContext(),
            [{ code: primitiveCode, path: "<unknown>", origin: "user" }],
            [],
            getParser(ast, defaultParser),
        );
        ctx = resolveDescriptors(ctx, ast);
        const wCtx = new WriterContext(ctx, "Contract1");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Struct1", optional: false },
                wCtx,
            ),
        ).toBe("(int, int)");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Struct2", optional: false },
                wCtx,
            ),
        ).toBe("(int)");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Contract1", optional: false },
                wCtx,
            ),
        ).toBe("(int, int)");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Contract2", optional: false },
                wCtx,
            ),
        ).toBe("(int, (int, int))");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Struct1", optional: true },
                wCtx,
            ),
        ).toBe("tuple");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Struct2", optional: true },
                wCtx,
            ),
        ).toBe("tuple");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Contract1", optional: true },
                wCtx,
            ),
        ).toBe("tuple");
        expect(
            resolveFuncType(
                { kind: "ref", name: "Contract2", optional: true },
                wCtx,
            ),
        ).toBe("tuple");
    });
});
