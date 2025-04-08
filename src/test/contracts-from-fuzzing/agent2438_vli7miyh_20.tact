struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct ColoredPoint {
    p: Point;
    color: String;
}

contract NestedSerialization {
    cp: ColoredPoint;

    init() {
        self.cp = ColoredPoint{ p: Point{ x:1, y:2 }, color: "#FFFFFF" };
    }
}
