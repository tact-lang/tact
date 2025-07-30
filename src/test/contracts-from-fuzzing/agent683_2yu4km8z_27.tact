struct InnerMost {
    val: Int;
}

struct InnerOpt {
    im: InnerMost?;
}

struct OuterOpt {
    io: InnerOpt?;
}

contract OptOptOpt {
    nested: OuterOpt?;

    init() {
        self.nested = null;
    }
}