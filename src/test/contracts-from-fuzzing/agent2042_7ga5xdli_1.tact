struct NestedStruct {
    x: Int;
    y: Int;
}

contract SingleNestedField {
    point: NestedStruct;
    init() {
        self.point = NestedStruct{ x: 5, y: 10 };
    }
}