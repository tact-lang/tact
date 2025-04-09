struct NestedStruct {
    a: Int;
    b: Bool;
}

contract UsesNestedStruct {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{ a: 1, b: true };
    }
}