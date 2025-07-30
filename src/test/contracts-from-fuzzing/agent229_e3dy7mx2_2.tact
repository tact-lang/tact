struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedStorage {
    nested: NestedStruct;
    
    init() {
        self.nested = NestedStruct{
            a: 1,
            b: false,
            c: "hello"
        };
    }
}
