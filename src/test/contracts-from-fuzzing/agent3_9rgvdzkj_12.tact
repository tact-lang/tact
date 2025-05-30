struct Inner { a: Int; b: Int }

struct Middle { inner: Inner; c: Int }

struct Outer { middle: Middle; d: Int }

// This asm function takes an Outer, which is a nested struct. The parameters are flattened in the order:
// First, Inner.a, then Inner.b, then Middle.c, then Outer.d
// That is, given Outer o, we get stack: [o.middle.inner.a, o.middle.inner.b, o.middle.c, o.d] (bottom-to-top)
// We want to compute the sum: o.middle.inner.a + o.middle.inner.b + o.middle.c + o.d
// We perform three ADD instructions to sum all four numbers.

asm fun sumOuter(o: Outer): Int { ADD ADD ADD }

fun main(): Int {
    // Provide values so that the sum is as expected:
    // Let o = Outer { middle: Middle { inner: Inner { a: 1, b: 2 }, c: 3}, d: 4 }.
    // The sum is 1 + 2 + 3 + 4 = 10
    return sumOuter(Outer{ middle: Middle{ inner: Inner{ a: 1, b: 2 }, c: 3}, d: 4 });
}
