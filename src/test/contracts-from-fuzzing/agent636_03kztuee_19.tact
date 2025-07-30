struct InnerOpt {
    value: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract NestedOptionalStructs2 {
    outer: OuterOpt?;

    init() {
        self.outer = null;
    }
}
