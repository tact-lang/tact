struct NestedOpt {
    flag: Bool?;
    number: Int?;
}

contract DeepNestedOptional {
    nested: NestedOpt?;
    
    init() {
        self.nested = null;
    }
}