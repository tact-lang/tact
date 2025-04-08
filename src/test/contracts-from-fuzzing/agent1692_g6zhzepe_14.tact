struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract OptionalNestedStruct {
    nestedOpt: InnerStruct?;

    init() {
        self.nestedOpt = null;
    }
}