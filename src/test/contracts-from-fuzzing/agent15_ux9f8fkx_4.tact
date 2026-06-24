struct Inner {
    X: Int;
    Y: Int;
}

struct Outer {
    inner: Inner;
    Z: Int;
}

contract TestNestedStruct {
    receive() {
        let i = Inner { X: 42, Y: 66 };
        let o = Outer { inner: i, Z: 99 };
        dump(o.inner.Y);
    }
}
