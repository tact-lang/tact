struct InnerMost {
    flag: Bool;
}

struct Inner {
    innerMost: InnerMost;
}

struct Outer {
    inner: Inner;
}

contract MultiNestedTest {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{
                innerMost: InnerMost{
                    flag: true,
                },
            },
        };
    }
}