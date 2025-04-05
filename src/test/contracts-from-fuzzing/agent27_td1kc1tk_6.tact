struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

fun testNested(o: Outer): Int {
    return o.inner.x;
}

contract NestedTest {
    receive() {
        let o = Outer{ inner: Inner{ x: 42, y: 84 }, flag: true };
        testNested(o);
    }
}
