struct NestedStruct {
    innerInt: Int;
    innerBool: Bool;
}

contract DeepNestedContract {
    nestedField: NestedStruct;
    deeperNested: NestedStruct;
    
    init() {
        self.nestedField = NestedStruct{ innerInt: 1, innerBool: true };
        self.deeperNested = NestedStruct{ innerInt: 2, innerBool: false };
    }
}
