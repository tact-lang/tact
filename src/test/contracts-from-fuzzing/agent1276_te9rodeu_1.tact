struct Nested {
    a: Int;
    b: Bool;
}

contract DeepOptionalTest {
    nestedOpt: Nested?;
    
    init() {
        self.nestedOpt = null;
    }
}