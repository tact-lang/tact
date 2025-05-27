import { itShouldNotCompile } from "@/test/compilation-failed/util";

describe("map-literal-errors", () => {
    itShouldNotCompile({
        testName: "map-literal-cell",
        errorMessage:
            "Could not reduce map literal: it either uses run-time values or unsupported features like structs, cells or asm functions",
    });
    itShouldNotCompile({
        testName: "map-literal-runtime",
        errorMessage:
            "Could not reduce map literal: it either uses run-time values or unsupported features like structs, cells or asm functions",
    });
    itShouldNotCompile({
        testName: "map-literal-structs",
        errorMessage:
            "Could not reduce map literal: it either uses run-time values or unsupported features like structs, cells or asm functions",
    });
    itShouldNotCompile({
        testName: "map-literal-uint-key-out-of-range",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '2' does not fit into 1-bit unsigned integer type",
    });
    itShouldNotCompile({
        testName: "map-literal-int-key-out-of-range",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '-129' does not fit into 8-bit signed integer type",
    });
    itShouldNotCompile({
        testName: "map-literal-int-val-out-of-range",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '8' does not fit into 4-bit signed integer type",
    });
    itShouldNotCompile({
        testName: "map-literal-uint-val-out-of-range",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '16' does not fit into 4-bit unsigned integer type",
    });
    itShouldNotCompile({
        testName: "map-literal-varuint-val-out-of-range",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '1329227995784915872903807060280344576' does not fit into variable-length unsigned integer type with 4-bit length",
    });
    itShouldNotCompile({
        testName: "map-literal-varint-val-out-of-range",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '-226156424291633194186662080095093570025917938800079226639565593765455331329' does not fit into variable-length signed integer type with 5-bit length",
    });
});
