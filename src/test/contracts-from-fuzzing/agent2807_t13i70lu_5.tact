struct Point {
    x: Int;
    y: Int;
}

contract NestedStruct {
    val: Point;
    init() {
        self.val = Point{ x: 1, y: 2 };
    }
}