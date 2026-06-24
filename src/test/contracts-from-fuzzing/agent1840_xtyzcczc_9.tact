struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Line {
    start: Point;
    end: Point;
    name: String;
}

contract Shapes {
    value: Line;
    init() {
        self.value = Line{
            start: Point{ x: 0, y: 0 },
            end: Point{ x: 1, y: 1 },
            name: "test"
        };
    }
}