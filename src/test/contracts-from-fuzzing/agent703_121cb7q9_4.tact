struct InnerMost {
    x: Int;
}

struct Inner {
    innerMost: InnerMost;
    y: Bool;
}

struct Outer {
    inner: Inner;
    z: Int;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{
                innerMost: InnerMost{ x: 123 },
                y: false
            },
            z: 999
        };
    }
}