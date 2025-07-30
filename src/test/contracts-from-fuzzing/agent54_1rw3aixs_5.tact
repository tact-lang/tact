struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
    y: Int;
}

contract Test {
    receive() {
        let s: Outer = Outer { inner: Inner { x: 5 }, y: 10 };
    }
}