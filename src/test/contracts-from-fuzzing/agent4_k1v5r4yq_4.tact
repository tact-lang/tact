struct Inner {
    field: Int;
}

struct Outer {
    inner: Inner;
}

contract TestNestedStruct {
    receive() {
        let i: Inner = Inner { field: 42 };
        let o: Outer = Outer { inner: i };
        let x: Int = o.inner.field;
    }
}
