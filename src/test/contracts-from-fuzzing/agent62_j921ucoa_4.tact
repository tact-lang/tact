struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestNested {
    receive() {
        let o = Outer { inner: Inner { a: 10, b: 20 }, flag: true };
        o.inner.a;
    }
}
