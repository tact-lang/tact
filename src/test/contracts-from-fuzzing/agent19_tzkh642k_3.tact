struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
    y: Int;
}

contract TestNested {
    receive() {
        let o: Outer = Outer{
            inner: Inner{ x: 123 },
            y: 456
        };
    }
}
