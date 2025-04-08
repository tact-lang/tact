struct NestedStruct {
    nestedField1: Int;
    nestedField2: Bool;
}

contract TestStorage {
    field1: Int;
    field2: Bool;
    field3: String;
    
    nested: NestedStruct;
    
    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = "test";
        self.nested = NestedStruct{ nestedField1: 5, nestedField2: false };
    }
}