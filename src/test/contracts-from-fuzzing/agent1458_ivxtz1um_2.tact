struct NestedStruct {
    x: Int;
    y: Int;
}

contract NestedField {
    point: NestedStruct;

    init() {
        self.point = NestedStruct{ x: 1, y: 2 };
    }
}