struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    inner: Inner;
    z: Int;
}

contract Test {
    receive() {
        let o = Outer {
            inner: Inner { x: 100, y: 200 },
            z: 300
        };
    }
}
