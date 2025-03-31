/// Snippet: Nested Flattening Test
/// This asm function tests parameter flattening for nested structures. It sums three integer values: the two fields of the inner struct and the direct field of the outer struct.

struct Inner { a: Int; b: Int }
struct Outer { inner: Inner; z: Int }

// After flattening, the parameters are pushed in the order: inner.a, inner.b, z. 
// The function uses two ADD instructions to sum them: first, ADD will sum inner.b and z (top two), then ADD will add inner.a with the result.
asm fun flatTest(o: Outer): Int { ADD ADD }

fun main() {
    let result = flatTest(Outer { inner: Inner { a: 10, b: 20 }, z: 30 });
    // Expected: 10 + 20 + 30 = 60
}
