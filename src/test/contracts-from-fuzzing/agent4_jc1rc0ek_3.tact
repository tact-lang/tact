struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    inner: Inner;
    x: Int;
}

contract TestNested {
    receive() {
        let o = Outer{
            inner: Inner{ a: 10, b: 20 },
            x: 100,
        };
        o.inner.a;
    }
}
