struct NestedOptionalPrims {
    i: Int?;
    b: Bool?;
    s: String?;
}

struct OuterWrap {
    nested: NestedOptionalPrims?;
}

contract NestedOptInOpt {
    val: OuterWrap?;

    init() {
        self.val = null;
    }
}
