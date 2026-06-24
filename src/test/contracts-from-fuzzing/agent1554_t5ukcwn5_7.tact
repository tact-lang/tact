struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
    optInner: Inner?;
}

contract NestedOptionals {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{ a: 7 },
            optInner: null,
        };
    }
}