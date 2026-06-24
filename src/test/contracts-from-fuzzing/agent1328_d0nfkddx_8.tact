struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Segment {
    start: Point;
    end: Point;
}

struct Shape {
    s1: Segment;
    s2: Segment;
    s3: Segment;
}

contract Geometry {
    shape: Shape;
    init() {
        self.shape = Shape{
            s1: Segment{ start: Point{ x:1, y:1 }, end: Point{ x:2, y:2 } },
            s2: Segment{ start: Point{ x:3, y:3 }, end: Point{ x:4, y:4 } },
            s3: Segment{ start: Point{ x:5, y:5 }, end: Point{ x:6, y:6 } },
        };
    }
}