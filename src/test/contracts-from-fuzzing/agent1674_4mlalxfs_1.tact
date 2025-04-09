struct Point {
    x: Int;
    y: Int;
}

contract NestedStruct {
    loc: Point;

    init() {
        self.loc = Point{x: 7, y: 9};
    }
}