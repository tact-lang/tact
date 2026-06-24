/* Test: asm function using nested struct parameters and deeply nested TVM instructions.
   We construct a nested struct with 2 levels (each with 8 fields, total 16 primitives) and sum them.
*/

struct Inner { a: Int; b: Int; c: Int; d: Int; e: Int; f: Int; g: Int; h: Int }
struct Outer { inner1: Inner; inner2: Inner }

// Because parameters are flattened, inner1 fields come first, then inner2 fields. We add all 16 values
asm fun sumNested(o: Outer): Int {
    // 15 ADD operations: we have 16 numbers, doing a left fold using ADD repeatedly
    ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD
}

fun main() : Int {
    // Construct Outer with two Inner, each summing to known values.
    // Let inner1 values be 1,2,...,8 (sum = 36) and inner2 be 9,...,16 (sum = 100); total = 136
    return sumNested(Outer{
        inner1: Inner{ a:1, b:2, c:3, d:4, e:5, f:6, g:7, h:8 },
        inner2: Inner{ a:9, b:10, c:11, d:12, e:13, f:14, g:15, h:16 }
    });
}
