struct NestedStruct {
    foo: Int;
    bar: Bool;
}

contract InitNestedStruct {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{ foo: 5, bar: true };
    }
}