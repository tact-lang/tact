struct InnerStruct {
    a: Int;
    b: Bool;
}

contract DeepNested {
    field: InnerStruct;
    
    init() {
        self.field = InnerStruct{ a: 1, b: true };
    }
}