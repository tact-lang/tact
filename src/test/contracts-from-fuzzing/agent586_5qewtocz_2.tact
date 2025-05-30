struct NestedStruct {
    value: Int;
    flag: Bool;
}

contract StructFieldContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{ value: 42, flag: true };
    }

    receive() {
        // toggle the flag in nested struct
        self.nested = NestedStruct{ value: self.nested.value + 1, flag: !self.nested.flag };
    }
}