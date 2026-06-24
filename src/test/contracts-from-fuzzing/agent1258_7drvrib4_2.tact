struct NestedStruct {
    a: Int;
    b: Bool;
}

contract NestedStructStorage {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ a: 5, b: true };
    }
}