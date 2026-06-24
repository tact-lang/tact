struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

contract Geometry {
    line: Line?;
    init() {
        self.line = Line{
            start: Point{ x:0, y:0 },
            end: Point{ x:1, y:1 },
        };
    }
}