struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
    label: String;
    flag: Bool;
    extra: Int?;
}

contract Test {
    line: Line;

    init() {
        self.line = Line{
            start: Point{ x: 1, y: 2 },
            end: Point{ x: 3, y: 4 },
            label: "L",
            flag: true,
            extra: null,
        };
    }
}
