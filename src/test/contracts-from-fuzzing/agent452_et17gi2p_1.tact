struct NestedStruct {
    a: Int;
    b: Int?;
}

contract TestContract {
    nestedField: NestedStruct;
    
    init() {
        self.nestedField = NestedStruct{
            a: 1,
            b: null,
        };
    }
}