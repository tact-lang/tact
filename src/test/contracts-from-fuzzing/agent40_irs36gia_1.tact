struct NestedPoint {
    pos: Point;
}

struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    nested: NestedPoint;

    init() {
        self.nested = NestedPoint{pos: Point{x:1,y:2}};
    }
}