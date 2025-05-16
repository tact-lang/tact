struct InnerBoolOpt {
    f: Bool?;
}

struct OuterBoolOpt {
    inner: InnerBoolOpt?;
    b: Bool?;
}

contract NestedBoolOpt {
    val: OuterBoolOpt;

    init() {
        self.val = OuterBoolOpt{inner: null, b: null};
    }
}