struct InnerMost {
    a: Int;
    b: Bool;
}

struct Inner {
    innerMost: InnerMost;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    num: Int;
}

contract NestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                innerMost: InnerMost{a: 1, b: true},
                flag: false
            },
            num: 42
        };
    }
}
