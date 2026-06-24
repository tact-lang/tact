struct Inner {
    a: Int as uint16;
    b: Int as uint16;
}

struct Outer {
    inner: Inner;
    c: Int as uint16;
}

contract Test {
    receive() {
        let o = Outer {
            inner: Inner { a: 1, b: 2 },
            c: 3
        };
    }
}
