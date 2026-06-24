struct InlineStruct {
    x: Int;
    y: Int;
}

contract Test {
    point: InlineStruct = InlineStruct{ x: 1, y: 2 };
    init() {
        self.point = InlineStruct{ x: 3, y: 4 };
    }
}