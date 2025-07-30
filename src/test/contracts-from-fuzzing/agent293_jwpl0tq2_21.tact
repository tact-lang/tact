contract NestedOptionals {
    nestedOpt: InnerStruct?;

    init() {
        self.nestedOpt = null;
    }
}

struct InnerStruct {
    x: Int;
    y: Bool;
}