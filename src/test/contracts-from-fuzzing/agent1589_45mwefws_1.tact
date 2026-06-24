struct NestedStruct {
    a: Int;
    b: Bool;
}

contract NestedStructStorage {
    stored: NestedStruct;

    init() {
        self.stored = NestedStruct{ a: 1, b: true };
    }
}