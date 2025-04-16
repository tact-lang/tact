struct InnerMost {
    value: Bool?;
}

struct Inner {
    innerMost: InnerMost;
    x: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract DeepNestTest {
    config: Outer;

    init() {
        self.config = Outer{
            inner: Inner{
                innerMost: InnerMost{
                    value: null
                },
                x: 99
            },
            flag: true
        };
    }
}