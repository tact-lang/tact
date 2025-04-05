struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    a: Int;
    inner: Inner;
    b: Int;
}

contract TestNested {
    receive() {
        let o = Outer {
            a: 1,
            inner: Inner { x: 2, y: 3 },
            b: 4,
        };
        let sum = o.a + o.inner.x + o.inner.y + o.b;
    }
}
