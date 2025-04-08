struct NestedStruct {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    
    nested: NestedStruct;
    
    init() {
        self.field1 = 1;
        self.field2 = true;
        self.nested = NestedStruct{ val1: 42, val2: false };
    }
}