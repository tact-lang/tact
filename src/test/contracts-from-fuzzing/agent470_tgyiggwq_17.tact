struct InnerOpt {
    a: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract NestedOption {
    fld: OuterOpt?;
    init() {
        self.fld = null;
    }
}