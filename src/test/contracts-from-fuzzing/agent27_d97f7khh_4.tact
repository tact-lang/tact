struct Inner {
    i: Int;
}

struct Outer {
    inner: Inner;
    x: Int;
}

contract TestNested {
    receive() {
        let o: Outer = Outer{
            inner: Inner{ i: 42 },
            x: 99
        };
        let _ = o.inner.i;
        let _ = o.x;
    }
}
