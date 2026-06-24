struct NestedStruct {
    x: Int;
    y: Int?;
}

contract SimpleFields {
    coord: NestedStruct;

    init() {
        self.coord = NestedStruct{ x: 5, y: null };
    }
}
