struct InnerMost {
    flag: Bool;
}

struct Inner {
    num: Int;
    nested: InnerMost;
}

struct Outer {
    inner: Inner;
    count: Int;
}

contract DeepNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                num: 10,
                nested: InnerMost{flag: true}
            },
            count: 5
        };
    }

    receive() {
        self.data = Outer{
            inner: Inner{
                num: 20,
                nested: InnerMost{flag: false}
            },
            count: 15
        };
    }
}