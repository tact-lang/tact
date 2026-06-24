struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Line {
    start: Point;
    end: Point;
}

contract NestedSerializationTest {
    line: Line;

    init() {
        self.line = Line{
            start: Point{ x:0, y:0 },
            end: Point{ x:10, y:10 }
        };
    }
}