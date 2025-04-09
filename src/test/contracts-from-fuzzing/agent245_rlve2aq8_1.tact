struct NestedStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    nested: NestedStruct;
    
    init() {
        self.nested = NestedStruct{ a: 17, b: true };
    }
}