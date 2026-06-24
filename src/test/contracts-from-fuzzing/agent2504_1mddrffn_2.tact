struct NestedStruct {
    x: Int;
    y: Bool;
    z: String?;
}

contract NestedStructFieldTest {
    ns: NestedStruct;
    
    init() {
        self.ns = NestedStruct{x: 10, y: true, z: null};
    }
}
