struct NestedStruct {
    a: Int;
    b: Bool;
}

contract SimplePersistence {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{a: 1, b: true};
    }
}
