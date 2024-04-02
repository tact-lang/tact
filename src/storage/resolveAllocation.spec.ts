import fs from "fs";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { resolveDescriptors } from "../types/resolveDescriptors";
import { getAllocations, resolveAllocations } from "./resolveAllocation";
import { openContext } from "../grammar/store";
import { resolveStatements } from "../types/resolveStatements";
import { CompilerContext } from "../context";
import { resolveSignatures } from "../types/resolveSignatures";
import path from "path";

const stdlibPath = path.resolve(__dirname, "../../stdlib/std/primitives.tact");
const stdlib = fs.readFileSync(stdlibPath, "utf-8");
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
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should write program", () => {
        let ctx = openContext(
            new CompilerContext(),
            [
                { code: stdlib, path: stdlibPath, origin: "stdlib" },
                { code: src, path: "<unknown>", origin: "user" },
            ],
            [],
        );
        ctx = resolveDescriptors(ctx);
        ctx = resolveSignatures(ctx);
        ctx = resolveStatements(ctx);
        ctx = resolveAllocations(ctx);
        expect(getAllocations(ctx)).toMatchSnapshot();
    });
});
