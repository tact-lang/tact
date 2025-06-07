struct NestedOpt {
    foo: Int?; 
    bar: Bool?;
}

contract DeepOptional {
    nestedField: NestedOpt?;
    
    init() {
        self.nestedField = null;
    }
}