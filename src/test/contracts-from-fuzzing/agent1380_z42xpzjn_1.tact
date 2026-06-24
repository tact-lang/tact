struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract DeepStorage {
    ns: NestedStruct;
    
    init() {
        self.ns = NestedStruct{
            a: 1,
            b: true,
            c: "test",
        };
    }
}