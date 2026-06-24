struct NestedStruct {
    nestedField: Int;
    optionalField: Bool?;
}

contract TestNested {
    complexField: NestedStruct;
    
    init() {
        self.complexField = NestedStruct{
            nestedField: 123,
            optionalField: true
        };
    }
}