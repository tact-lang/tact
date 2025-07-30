struct NestedStruct {
    x: Int;
    y: Int?;
}

contract BasicNestedTest {
    coord: NestedStruct;

    init() {
        self.coord = NestedStruct{ x: 5, y: null };
    }
}
