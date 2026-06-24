struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Line {
    start: Point;
    end: Point;
}

contract TestContract {
    a: Point;
    b: Line;

    init() {
        self.a = Point{ x: 10, y: 20 };
        self.b = Line{
            start: Point{ x: 0, y: 0 },
            end: Point{ x: 100, y: 100 },
        };
    }
}