struct Nested {
    nestedBool: Bool;
    nestedInt: Int;
}

contract DeepOptionalTest {
    deepOpt: Nested?;
    
    init() {
        self.deepOpt = null;
    }
}