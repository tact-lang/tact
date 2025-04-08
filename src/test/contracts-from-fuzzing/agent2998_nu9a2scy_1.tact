struct OptionalNest {
    nestedOpt: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestOptionalNest {
    opt: OptionalNest;

    init() {
        self.opt = OptionalNest{ nestedOpt: null };
    }
}