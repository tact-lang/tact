struct Point {
    x: Int;
    y: Int;
}

contract OptionalNestedStruct {
    coord: Point?;
    init() {
        self.coord = null;
    }
}