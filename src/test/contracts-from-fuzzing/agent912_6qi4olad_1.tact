struct InnerStruct {
    a: Int = 7;
    b: Bool = false;
    c: String = "hello";
}

contract NestedTest {
    nested: InnerStruct;
    
    init() {
        self.nested = InnerStruct{};
    }
}