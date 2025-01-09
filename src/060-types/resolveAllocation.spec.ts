import fs from "fs";
import { resolveDescriptors } from "./resolveDescriptors";
import { getAllocations, resolveAllocations } from "./resolveAllocation";
import { openContext } from "../050-grammar/store";
import { resolveStatements } from "./resolveStatements";
import { CompilerContext } from "../010-pipeline/context";
import { resolveSignatures } from "./resolveSignatures";
import path from "path";
import { getParser } from "../050-grammar";
import { getAstFactory } from "../050-grammar/ast";
import { defaultParser } from "../050-grammar/grammar";
import { stdlibPath } from "../040-imports/path";

const primitivesPath = path.resolve(stdlibPath, "std/primitives.tact");
const stdlib = fs.readFileSync(primitivesPath, "utf-8");
const src = `

trait BaseTrait {
    
}

struct Point3 {
    a: Point;
    b: Point2;
}

struct Point {
    x: Int;
    y: Int;
}

struct Point2 {
    z: Point;
}

struct Deep {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
    k: Int;
}

struct Deep2 {
    a: Deep;
    b: Deep;
    c: Deep;
}

contract Sample {
    v: Int = 0;
    init() {

    }
    fun main(a: Int, b: Int) {
    }
}
`;

describe("resolveAllocation", () => {
    it("should write program", () => {
        const ast = getAstFactory();
        let ctx = openContext(
            new CompilerContext(),
            [
                { code: stdlib, path: primitivesPath, origin: "stdlib" },
                { code: src, path: "<unknown>", origin: "user" },
            ],
            [],
            getParser(ast, defaultParser),
        );
        ctx = resolveDescriptors(ctx, ast);
        ctx = resolveSignatures(ctx);
        ctx = resolveStatements(ctx);
        ctx = resolveAllocations(ctx);
        expect(getAllocations(ctx)).toMatchSnapshot();
    });
});
