struct Inner {
    x: Int;
    y: Int
}

struct Outer {
    inner: Inner;
    z: Int
}

contract TestNestedStructs {
    receive() {
        let o: Outer = Outer {
            inner: Inner { x: 10, y: 20 },
            z: 30
        };
        let _ = o.inner.x + o.inner.y + o.z;
        return;
    }
}
