struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
    b: Bool;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{ a: 42 },
            b: true,
        };
    }
}