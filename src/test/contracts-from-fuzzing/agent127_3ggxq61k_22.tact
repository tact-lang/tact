struct NestedStructOptionalField {
    val: Int;
}

contract OptionalOfNestedStruct {
    nestedOpt: NestedStructOptionalField?;

    init() {
        self.nestedOpt = null;
    }
}