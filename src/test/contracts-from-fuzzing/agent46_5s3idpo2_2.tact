struct NestedStruct {
    innerVal: Int;
}

contract NestedStructField {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{ innerVal: 123 };
    }
}
