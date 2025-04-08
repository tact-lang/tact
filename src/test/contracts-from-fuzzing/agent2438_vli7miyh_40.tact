struct OuterMost {
    nested: InnerMost?;
}

struct InnerMost {
    val: Int;
}

contract OptionalNestedOrder {
    s: OuterMost;

    init() {
        self.s = OuterMost{ nested: null };
    }
}
