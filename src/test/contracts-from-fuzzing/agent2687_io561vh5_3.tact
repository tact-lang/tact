struct NestedStruct {
    x: Int;
    y: Int;
}

contract StructStorage {
    point: NestedStruct;

    init() {
        self.point = NestedStruct{ x: 3, y: 4 };
    }
}