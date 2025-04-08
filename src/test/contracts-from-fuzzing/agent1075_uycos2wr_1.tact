struct InnerStruct {
    a: Int;
    b: Bool;
}

contract DeepNestedPersistent {
    data: InnerStruct;
    
    init() {
        self.data = InnerStruct{ a: 10, b: true };
    }
}