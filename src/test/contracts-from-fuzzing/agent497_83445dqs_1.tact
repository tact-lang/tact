struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    nested: NestedStruct;
    
    init() {
        self.nested = NestedStruct{
            a: 5,
            b: true,
            c: "test"
        };
    }
}