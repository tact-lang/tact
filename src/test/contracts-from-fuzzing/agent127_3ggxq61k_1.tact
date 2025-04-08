struct NestedStruct {
    x: Int;
    y: Int?;
}

contract HasNestedStruct {
    coord: NestedStruct;

    init() {
        self.coord = NestedStruct{ x: 1, y: null };
    }
}