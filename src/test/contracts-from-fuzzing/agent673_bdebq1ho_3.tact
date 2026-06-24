struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Line {
    start: Point;
    end: Point;
    label: String?;
}

contract Geometry {
    current: Line;

    init() {
        self.current = Line{
            start: Point{ x: 0, y: 0 },
            end: Point{ x: 10, y: 10 },
            label: null
        };
    }
}