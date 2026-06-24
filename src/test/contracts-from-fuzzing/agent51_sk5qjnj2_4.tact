struct Inner {
    field: Int;
}

struct Outer {
    inner: Inner;
}

contract TestNested {
    receive() {
        let o: Outer = Outer { inner: Inner { field: 42 } };
        dump(o.inner.field);
    }
}
