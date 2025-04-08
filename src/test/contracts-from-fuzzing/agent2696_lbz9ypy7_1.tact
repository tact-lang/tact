struct NestedStruct {
    x: Int;
    y: String?;
    z: Bool;
}

contract DeepTest {
    nested: NestedStruct;
    
    init() {
        self.nested = NestedStruct{
            x: 1,
            y: "hi",
            z: false,
        };
    }
}