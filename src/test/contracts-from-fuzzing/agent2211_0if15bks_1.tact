struct NestedStruct {
    field1: Int;
    field2: Bool;
}

contract DeepOptionalStorage {
    nestedField: NestedStruct?;
    simpleInt: Int = 0;
    
    init() {
        self.nestedField = null;
        self.simpleInt = 42;
    }
}