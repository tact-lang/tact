struct InnerMost {
    value: Int?;
}

struct MiddleOpt {
    optionalInner: InnerMost?;
}

contract OptionalNest {
    nested: MiddleOpt;

    init() {
        self.nested = MiddleOpt{ optionalInner: null };
    }
}