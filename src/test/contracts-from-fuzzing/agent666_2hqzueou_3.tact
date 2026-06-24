struct InnerMost {
    value: String;
}

struct Inner {
    innerMost: InnerMost;
    flag: Bool;
}

struct Outer {
    inner: Inner;
}

contract DeepNestedTest {
    outer: Outer;

    init() {
        self.outer = Outer{inner: Inner{innerMost: InnerMost{value: "deep"}, flag: true}};
    }
}