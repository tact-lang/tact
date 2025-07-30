struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

contract GeometryContract {
    line: Line;

    init() {
        self.line = Line{
            start: Point{ x:1, y:2 },
            end: Point{ x:3, y:4 }
        };
    }
}