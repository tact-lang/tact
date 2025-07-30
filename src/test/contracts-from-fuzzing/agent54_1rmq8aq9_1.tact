struct Nested {
    a: Int;
    b: Bool;
}

contract DeepOptional {
    param: Nested?;
    
    init() {
        self.param = null;
    }
}