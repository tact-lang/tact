struct NestedStruct {
    field1: Int;
    field2: Bool;
    field3: String;
}

contract UseNested {
    nested: NestedStruct;
    
    init() {
        self.nested = NestedStruct{
            field1: 7,
            field2: true,
            field3: "hello",
        };
    }
}
