struct NestedStruct {
    x: Int;
    y: Int;
}

contract SingleStructField {
    coord: NestedStruct;

    init() {
        self.coord = NestedStruct{ x: 1, y: 2 };
    }
}