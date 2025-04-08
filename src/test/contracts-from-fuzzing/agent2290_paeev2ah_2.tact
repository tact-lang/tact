struct NestedStruct {
    x: Int;
    y: Bool;
    z: String?;
}

contract Test2 {
    val: NestedStruct;
    
    init() {
        self.val = NestedStruct{
            x: 42,
            y: false,
            z: null
        };
    }
}