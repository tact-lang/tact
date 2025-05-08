struct Point {
    x: Int;
    y: Int;
}

contract NestedStruct1 {
    position: Point;

    init() {
        self.position = Point{ x: 5, y: 7 };
    }
}