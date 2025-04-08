struct InnerMost {
    a: Int;
}

struct MiddleNested {
    inner: InnerMost;
    another: InnerMost;
}

struct Outer {
    m1: MiddleNested;
    m2: MiddleNested;
}

contract ComplexNestedFields {
    storage: Outer;

    init() {
        self.storage = Outer{
            m1: MiddleNested{inner: InnerMost{a:1}, another: InnerMost{a:2}},
            m2: MiddleNested{inner: InnerMost{a:3}, another: InnerMost{a:4}}
        };
    }
}