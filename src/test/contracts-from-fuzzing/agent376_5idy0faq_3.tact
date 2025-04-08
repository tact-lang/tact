struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Line {
    start: Point;
    end: Point;
}

contract NestedStructs {
    shape: Line;

    init() {
        self.shape = Line{
            start: Point{ x: 1, y: 2 },
            end: Point{ x: 3, y: 4 },
        };
    }
}