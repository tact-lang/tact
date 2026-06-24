struct InnerMost {
    f1: Int;
}

struct Inner {
    im: InnerMost;
    flag: Bool;
}

contract DeepNestedTest {
    nested: Inner;

    init() {
        self.nested = Inner{
            im: InnerMost{f1: 42},
            flag: false
        };
    }
}