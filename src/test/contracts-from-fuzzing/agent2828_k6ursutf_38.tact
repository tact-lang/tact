struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

contract DoubleTrailingComma {
    l: Line;

    init() {
        self.l = Line{
            start: Point{ x:0, y:0, },
            end: Point{ x:1, y:1, },
        };
    }
}