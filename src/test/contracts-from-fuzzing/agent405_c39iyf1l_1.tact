struct Nested {
    n1: Int;
    n2: Bool;
}

contract DeepOptional {
    s_field: Nested?;
    
    init() {
        self.s_field = null;
    }
}