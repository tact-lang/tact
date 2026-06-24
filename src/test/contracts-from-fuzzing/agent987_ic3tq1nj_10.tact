struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

contract OptionalNestedStructField {
    line: Line?;

    init() {
        self.line = null;
    }
}