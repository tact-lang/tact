struct InnerMost {
    a: Int;
    b: Bool;
}

struct Inner {
    innerMost: InnerMost;
    s: String;
}

contract CompositeTest {
    nested: Inner;

    init() {
        self.nested = Inner{
            innerMost: InnerMost{a: 1, b: false},
            s: "abc"
        };
    }
}