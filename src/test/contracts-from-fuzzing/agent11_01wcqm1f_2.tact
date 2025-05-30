struct Inner { x: Int; y: Int }
struct Outer { inner: Inner; z: Int }

// Test assembly function with a nested struct as parameter. The parameter should be flattened: first inner.x, then inner.y, then z.
// It adds these values and pushes the result on the stack.
asm fun sumOuter(o: Outer): Int { 
    // The stack, after flattening, should be: o.inner.x, o.inner.y, o.z (top)
    // We need to add them in correct order. First, add top two: add o.inner.y and o.z, then add o.inner.x
    ADD  // adds top two: (o.inner.y + o.z) now on top
    SWAP // bring o.inner.x to top
    ADD  // adds o.inner.x + (o.inner.y+o.z)
}

// The main function should not return a value based on Tact's expectations for the entry point.
fun main() {
    // We call sumOuter and then discard the result
    let _ = sumOuter(Outer { inner: Inner { x: 10, y: 20 }, z: 30 });
}
