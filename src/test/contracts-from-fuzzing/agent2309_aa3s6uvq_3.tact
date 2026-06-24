struct Inner {
    a: Int;
}

struct Outer {
    x: Int;
    y: Int;
    inner: Inner;
}

contract NestedOrdering {
    state: Outer;

    init() {
        self.state = Outer{
            x: 1,
            y: 2,
            inner: Inner{a: 3}
        };
    }
}