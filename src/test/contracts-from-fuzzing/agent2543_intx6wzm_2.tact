struct Point {
    x: Int;
    y: Int;
}

struct NestedPoint {
    point: Point;
    label: String;
    optPoint: Point?;
}

contract NestedTest {
    p: NestedPoint;
    init() {
        self.p = NestedPoint{
            point: Point{ x: 1, y: 2 },
            label: "test",
            optPoint: null
        };
    }
}