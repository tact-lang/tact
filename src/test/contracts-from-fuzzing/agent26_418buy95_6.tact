struct NestedOpt {
    inner: Int?;
}

struct OuterOpt {
    nested: NestedOpt?;
}

contract DeepOpt {
    field: OuterOpt;
    init() {
        self.field = OuterOpt{ nested: null };
    }
}