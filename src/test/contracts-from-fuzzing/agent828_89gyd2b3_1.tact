struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    nested: NestedStruct; 

    init() {
        self.nested = NestedStruct{
            a: 1,
            b: true,
            c: "test"
        };
    }
}