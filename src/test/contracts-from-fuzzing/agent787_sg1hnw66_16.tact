struct Point {
    x: Int as uint8;
    y: Int as int64;
}

struct Line {
    a: Point;
    b: Point;
}

contract TestContract {
    line: Line = Line{ a: Point{ x: 1, y: 2 }, b: Point{ x: 3, y: 4 } };

    init() {
        self.line = Line{ a: Point{ x: 10, y: 20 }, b: Point{ x: 30, y: 40 } };
    }
}