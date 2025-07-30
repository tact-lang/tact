struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    note: String?;
}

contract NestedOptional {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{ x: 42, y: false },
            note: null
        };
    }
}