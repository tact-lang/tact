struct NestedStruct {
    innerFlag: Bool;
    innerVal: Int;
}

contract WithNestedStruct {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{ innerFlag: false, innerVal: 42 };
    }
}