struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    c: String;
}

contract NestedStructContract {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{ a: 1, b: false },
            c: "hello",
        };
    }
}
