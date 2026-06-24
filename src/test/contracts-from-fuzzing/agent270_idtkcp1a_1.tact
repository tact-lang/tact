struct NestedStruct {
    a: Int;
    b: Bool;
}

contract DeepOptionalTest {
    s: NestedStruct?;
    
    init() {
        self.s = null;
    }
}