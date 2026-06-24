struct Inner { x: Int; y: Int }
struct Outer { inner: Inner; z: Int }

fun testOuter(outer: Outer): Int {
    let Outer { inner: innerVal, z: _ } = outer;
    let Inner { x, y: _ } = innerVal;
    return x;
}

contract Test {
    receive() {}
}
