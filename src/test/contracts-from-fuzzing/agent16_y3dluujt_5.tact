struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
    count: Int;
}

contract TestNested {
    receive() {
        let o: Outer = Outer {
            inner: Inner { value: 42 },
            count: 100
        };
    }
}
