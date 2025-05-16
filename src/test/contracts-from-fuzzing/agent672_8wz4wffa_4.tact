struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalNested {
    nestedOpt: OptionalStruct?;

    init() {
        self.nestedOpt = null;
    }
}