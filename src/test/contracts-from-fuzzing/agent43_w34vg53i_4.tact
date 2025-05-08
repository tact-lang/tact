struct Inner {
    i: Int;
}

struct Outer {
    inner: Inner;
    field: Int;
}

contract TestNested {
    receive() {
        let o: Outer = Outer { inner: Inner { i: 42 }, field: 100 };
        o.inner.i;
    }
}
