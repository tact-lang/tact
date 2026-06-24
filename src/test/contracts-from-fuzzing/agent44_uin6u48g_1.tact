struct Nested {
    x: Int;
    y: Int;
}

contract DeepOptional {
    nestedField: Nested?;
    
    init() {
        self.nestedField = null;
    }
}
