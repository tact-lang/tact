struct Inner {
    a: Int
}

struct Outer {
    inner: Inner;
    b: Int
}

contract TestNested {
    receive() {
        let o: Outer = Outer {
            inner: Inner { a: 42 },
            b: 100
        };
        o.inner.a;
    }
}
