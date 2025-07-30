struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    value: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ a: 1, b: true },
            value: 42
        };
    }
}