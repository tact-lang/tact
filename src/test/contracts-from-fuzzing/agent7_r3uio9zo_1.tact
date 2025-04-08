struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    field1: Int;
    field2: InnerStruct;
    
    init() {
        self.field1 = 42;
        self.field2 = InnerStruct{ a: 1, b: true };
    }
}