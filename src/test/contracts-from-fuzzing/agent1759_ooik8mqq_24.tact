struct NestedOpt {
    inner: String?;
}

struct OuterOpt {
    nested: NestedOpt?;
}

contract DoubleOpt {
    field: OuterOpt;

    init() {
        self.field = OuterOpt { nested: null };
    }
}
