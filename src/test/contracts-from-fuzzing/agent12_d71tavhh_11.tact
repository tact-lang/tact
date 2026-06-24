// Test 1: Assembly function with a nested struct parameter and non-trivial TVM instructions
// This tests that nested structures are correctly flattened on the stack and can be manipulated via TVM instructions.

struct A { a: Int; b: Int }
struct Nested { inner: A; extra: Int }

// The parameter 'n' of type Nested gets flattened to: inner.a, inner.b, extra
// We aim to compute: inner.a + inner.b + extra
// The TVM stack initially: [inner.a, inner.b, extra] (inner.a at bottom, extra at top)
// We'll perform: SWAP, then ADD, then ADD:
// SWAP: swaps top two => stack becomes [inner.a, extra, inner.b]
// ADD: pops top two: extra and inner.b, pushes their sum => stack: [inner.a, (inner.b+extra)]
// ADD: pops both and pushes their sum => (inner.a + inner.b + extra) on stack

asm fun processNested(n: Nested): Int {
    SWAP
    ADD
    ADD
}

fun main() {
    let a = A { a: 10, b: 20 };
    let n = Nested { inner: a, extra: 30 };
    let result: Int = processNested(n);
    // Expected result: 10 + 20 + 30 = 60
}
