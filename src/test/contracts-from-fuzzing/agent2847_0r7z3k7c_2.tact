struct NestedStruct {
    n1: Int;
    n2: Bool;
    n3: String;
}

contract TestNested {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            n1: 10,
            n2: true,
            n3: "abc",
        };
    }
}