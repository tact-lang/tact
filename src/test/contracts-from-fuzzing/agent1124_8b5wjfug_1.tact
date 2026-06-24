struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    c: Int;
}

contract NestedStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ a: 1, b: true },
            c: 42
        };
    }
}