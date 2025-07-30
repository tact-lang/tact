struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    inner: Inner;
    z: Int;
}

contract TestNested {
    receive() {
        let o = Outer {
            inner: Inner { x: 10, y: 20 },
            z: 30
        };
        o.inner.x;
    }
}
