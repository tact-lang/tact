struct InnerMost {
    val: Int;
}

struct InnerOpt {
    nested: InnerMost?;
}

struct OuterOpt {
    nestedOpt: InnerOpt?;
}

contract OptInOptInOpt {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ nestedOpt: null };
    }
}