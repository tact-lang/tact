struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

contract TestContract {
    line: Line;

    init() {
        self.line = Line{
            start: Point{x: 0, y: 0},
            end: Point{x: 10, y: 10},
        };
    }
}