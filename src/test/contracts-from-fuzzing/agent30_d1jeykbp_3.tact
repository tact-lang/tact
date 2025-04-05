struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    inner: Inner;
    y: Int;
}

contract TestNested {
    receive() {
        let o: Outer = Outer{ inner: Inner{ a: 10, b: 20 }, y: 30 };
        o.inner.b;
    }
}
