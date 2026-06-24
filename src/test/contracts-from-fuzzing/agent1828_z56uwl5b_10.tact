struct Point {
    x: Int;
    y: Int;
}

struct Polygon {
    p1: Point;
    p2: Point;
    p3: Point;
    p4: Point;
}

contract TestContract {
    shape: Polygon?;

    init() {
        self.shape = Polygon{
            p1: Point{x:0, y:0},
            p2: Point{x:1, y:0},
            p3: Point{x:1, y:1},
            p4: Point{x:0, y:1}
        };
    }
}