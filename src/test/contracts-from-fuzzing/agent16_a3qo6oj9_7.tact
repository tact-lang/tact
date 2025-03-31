/// Snippet 7: Testing nested structure flattening in asm functions

struct Inner { x: Int; y: Int }
struct Outer { inner: Inner; z: Int }

// The flattened order for Outer is: inner.x, inner.y, z
// The asm function will pop the top two items and then add them, then add the remaining value.
// Behavior: Stack initially: [inner.x, inner.y, z] => top: z, then inner.y, then inner.x
// First ADD takes inner.y and z, then second ADD sums inner.x with (inner.y+z)
asm fun sum_nested(outer: Outer): Int { ADD ADD }

fun main() {
    // Expect: 10 + 20 + 30 = 60
    let result = sum_nested(Outer { inner: Inner { x: 10, y: 20 }, z: 30 });
}
