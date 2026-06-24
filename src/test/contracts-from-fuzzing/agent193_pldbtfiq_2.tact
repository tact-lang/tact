struct InnerMost {
    x: Int;
}

struct Inner {
    inner_most: InnerMost;
}

contract TestContract {
    nested_deep: Inner;

    init() {
        self.nested_deep = Inner{inner_most: InnerMost{x: 42}};
    }
}