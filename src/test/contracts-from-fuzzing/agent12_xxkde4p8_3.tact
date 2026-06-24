struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
}

contract TestNestedStruct {
    receive() {
        let o: Outer = Outer {
            inner: Inner { x: 123 }
        };
        o.inner.x;
    }
}
