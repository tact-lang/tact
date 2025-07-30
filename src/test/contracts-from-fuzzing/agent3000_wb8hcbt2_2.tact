struct NestedStruct {
    n1: Int;
    n2: Bool;
    n3: String;
}

contract Test2 {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            n1: 123,
            n2: false,
            n3: "abc",
        };
    }
}
