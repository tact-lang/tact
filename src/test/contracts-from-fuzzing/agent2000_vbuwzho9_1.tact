struct NestedOptional {
    field1: Int?;
    field2: Bool?;
}

contract TestDeepOptional {
    nested: NestedOptional?;
    
    init() {
        self.nested = null;
    }
}