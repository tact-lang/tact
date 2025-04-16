struct Nested {
    field1: Int;
    optField: Int?;
}

contract DeepOptional {
    deepOpt: Nested?;
    
    init() {
        self.deepOpt = null;
    }
}