struct NestedStruct {
    x: Int;
    y: Int?;
}

contract StructAsField {
    point: NestedStruct;
    init() {
        self.point = NestedStruct{ x: 2, y: null };
    }
}