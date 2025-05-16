struct InnerMost {
    deepVal: Int? = null;
}

struct MiddleOpt {
    nested: InnerMost?;
}

contract OptionInOpt {
    field: MiddleOpt;

    init() {
        self.field = MiddleOpt{ nested: InnerMost{} };
    }
}