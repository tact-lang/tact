struct Innermost {
    value: Int;
}

struct InnerOpt {
    inner: Innermost?;
}

struct OuterOpt {
    nested: InnerOpt?;
}

contract DeepOptionalInterleaved {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{ nested: InnerOpt{ inner: Innermost{ value: 123 } } };
    }
}
