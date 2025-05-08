struct Point { x: Int; y: Int; }

struct Line { start: Point; end: Point; }

struct Triangle { p1: Point; p2: Point; p3: Point; }

struct Geometry {
    line: Line;
    triangle: Triangle;
}

contract DeepStructField {
    container: Geometry;

    init() {
        self.container = Geometry{
            line: Line{ start: Point{ x: 0, y: 0 }, end: Point{ x: 1, y: 1 } },
            triangle: Triangle{
                p1: Point{ x: 1, y: 0 },
                p2: Point{ x: 0, y: 1 },
                p3: Point{ x: 1, y: 1 },
            },
        };
    }
}