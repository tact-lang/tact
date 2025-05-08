struct Inner {
    a: Int;
    b: Int
}

struct Outer {
    inner: Inner;
    x: Int;
    y: Int
}

contract TestNested {
    receive() {
        let o = Outer { inner: Inner { a: 10, b: 20 }, x: 30, y: 40 };
        o.inner.a + o.x;
    }
}
