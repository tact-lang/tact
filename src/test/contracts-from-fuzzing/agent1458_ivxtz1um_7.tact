struct OptionalNestedInner {
    s: String?;
}

struct OptionalNestedOuter {
    nested: OptionalNestedInner?;
}

contract OptionalStructNestedInOptional {
    data: OptionalNestedOuter;

    init() {
        self.data = OptionalNestedOuter{ nested: null };
    }
}