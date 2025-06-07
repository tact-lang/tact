struct InnerMost {
    a: Int;
    b: Bool;
}

struct Inner {
    x: Int?;
    y: InnerMost;
}

contract DeepNestedTest {
    nested: Inner;

    init() {
        self.nested = Inner{
            x: null,
            y: InnerMost{a: 1, b: true}
        };
    }
}