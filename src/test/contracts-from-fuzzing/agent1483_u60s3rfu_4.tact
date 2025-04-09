struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Line {
    start: Point;
    end: Point;
    label: String?;
}

contract LineStorage {
    line: Line;

    init() {
        self.line = Line{
            start: Point{x: 0, y: 0},
            end: Point{x: 1, y: 1},
            label: null,
        };
    }
}