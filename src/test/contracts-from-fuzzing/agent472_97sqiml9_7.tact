struct Point { x: Int; y: Int; }

struct Line { start: Point; end: Point; }

struct Polygon {
    p1: Point;
    p2: Point;
    line: Line;
}

contract GeomTest {
    shape: Polygon;

    init() {
        self.shape = Polygon{
            p1: Point{ x: 0, y: 1 },
            p2: Point{ x: 1, y: 2 },
            line: Line{ start: Point{ x: 5, y: 5 }, end: Point{ x: 7, y: 7 } }
        };
    }
}