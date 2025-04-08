struct Nested { inner: Int; optInner: Int?; }

contract DeepOptional {
    nestedOpt: Nested?;
    intOpt: Int?;
    boolOpt: Bool?;

    init() {
        self.nestedOpt = null;
        self.intOpt = null;
        self.boolOpt = null;
    }
}