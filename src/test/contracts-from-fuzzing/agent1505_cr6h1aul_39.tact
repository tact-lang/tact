struct InnerOpt {
    b: Bool?;
}

contract StructOptWrap {
    s: InnerOpt?;
    init() {
        self.s = null;
    }
}