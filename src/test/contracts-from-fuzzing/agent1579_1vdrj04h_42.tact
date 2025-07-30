struct InnerBool {
    b1: Bool;
}

struct OuterOpt {
    inner: InnerBool?;
}

contract NestedBoolOption {
    field: OuterOpt;
    init() {
        self.field = OuterOpt{ inner: null };
    }
}