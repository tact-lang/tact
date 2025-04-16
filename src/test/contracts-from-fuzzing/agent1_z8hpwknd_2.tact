struct NestedStruct {
    innerVal: Int;
}

contract WithStruct {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{ innerVal: 5 };
    }
}