struct NestedOpt {
    nested: Int?;
}

struct OuterOpt {
    inner: NestedOpt?;
}

contract NullInit {
    field: OuterOpt?;

    init() {
        self.field = null;
    }
}