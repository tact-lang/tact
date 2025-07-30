struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    inner: Inner;
    x: Int;
}

contract TestNestedStructs {
    receive() {
        let o: Outer = Outer {
            inner: Inner { a: 10, b: 20 },
            x: 30
        };
    }
}
