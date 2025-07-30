contract NestedOptionalContract {
    nestedOpt: OptionalStruct?;

    init() {
        self.nestedOpt = null;
    }
}

struct OptionalStruct {
    n: InnerStruct?;
}

struct InnerStruct {
    x: Int;
}