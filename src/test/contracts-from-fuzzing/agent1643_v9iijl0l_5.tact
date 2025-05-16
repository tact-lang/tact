struct OptionalNestedInner {
    val: Int;
}

struct OptionalNestedOuter {
    inner: OptionalNestedInner?;
}

contract OptionalNestedFieldContract {
    nested: OptionalNestedOuter;

    init() {
        self.nested = OptionalNestedOuter{ inner: null };
    }
}
