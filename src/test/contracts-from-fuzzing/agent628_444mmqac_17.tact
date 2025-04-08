struct OptNestedInner {
    value: Int?;
}

struct OptNestedOuter {
    nested: OptNestedInner?;
}

contract OptionalNesting {
    test: OptNestedOuter;

    init() {
        self.test = OptNestedOuter{ nested: null };
    }
}