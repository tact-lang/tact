struct NestedStruct {
    nestedValue1: Int;
    nestedValue2: Bool?;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    field3: NestedStruct;
    
    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = NestedStruct{nestedValue1: 42, nestedValue2: null};
    }
    
    receive() {
        self.field1 = 2;
    }
}