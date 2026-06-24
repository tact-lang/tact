struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Line {
    start: Point;
    end: Point;
    label: String;
    active: Bool = true;
}

contract Geometry {
    line: Line = Line{
        start: Point{ x: 0, y: 0 },
        end: Point{ x: 1, y: 1 },
        label: "L1",
        active: true,
    };

    init() {
        self.line = self.line;
    }

    receive() {
        self.line = self.line;
    }
}