struct NestedStruct {
    x: Int;
    y: Int?;
}

contract TestContract {
    coord: NestedStruct;

    init() {
        self.coord = NestedStruct{ x: 10, y: null };
    }
}