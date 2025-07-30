struct Point {
    x: Int;
    y: Int;
}

struct NamedPoint {
    point: Point;
    name: String;
}

contract NestedStructs {
    np: NamedPoint;

    init() {
        self.np = NamedPoint{
            point: Point{ x:1, y:2 },
            name: "A",
        };
    }
}
