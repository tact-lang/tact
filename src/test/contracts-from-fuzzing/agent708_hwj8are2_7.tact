struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

struct Shape {
    line1: Line;
    line2: Line;
}

contract Geometry {
    s: Shape;

    init() {
        self.s = Shape{
            line1: Line{ start: Point{ x: 1, y: 2 }, end: Point{ x: 3, y: 4 } },
            line2: Line{ start: Point{ x: 5, y: 6 }, end: Point{ x: 7, y: 8 } }
        };
    }
}