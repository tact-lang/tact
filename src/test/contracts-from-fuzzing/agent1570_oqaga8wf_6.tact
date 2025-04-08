struct InnerMost {
    value: Int;
}

struct Middle {
    nested: InnerMost;
}

struct OuterMost {
    wrap: Middle;
}

contract NullDeepOption {
    field: OuterMost?;

    init() {
        self.field = null;
    }
}