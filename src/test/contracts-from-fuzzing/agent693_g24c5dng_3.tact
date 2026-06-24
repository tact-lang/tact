struct InnerMost {
    v: Int;
}

struct InnerOpt {
    inner: InnerMost?;
}

struct OuterOpt {
    nested: InnerOpt?;
}

contract DeepOpt {
    field: OuterOpt?;

    init() {
        self.field = null;
    }
}