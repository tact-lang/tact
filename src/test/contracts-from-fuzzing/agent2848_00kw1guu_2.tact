struct NestedStruct {
    innerValue: Int;
}

contract NestedStructField {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{ innerValue: 42 };
    }
}