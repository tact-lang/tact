struct NestedStruct {
    x: Int;
    y: Int;
}

contract DeepNestedContract {
    nestedField: NestedStruct;
    deepNested: NestedStruct;

    init() {
        self.nestedField = NestedStruct{x:1, y:2};
        self.deepNested = NestedStruct{x:3, y:4};
    }
}