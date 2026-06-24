struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    field: Int;
}

contract NestedOpt {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{ inner: null };
    }
}