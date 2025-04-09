struct NestedStruct {
    a: Int;
    b: Bool;
}

contract ContainsNested {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{ a: 10, b: true };
    }
}
