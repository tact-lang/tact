struct NestedStruct {
    x: Int;
    y: Bool;
}

contract WithNestedStruct {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ x: 1, y: false };
    }
}
