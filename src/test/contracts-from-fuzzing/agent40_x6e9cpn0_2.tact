struct Point {
    x: Int;
    y: Int;
}

struct Segment {
    a: Point;
    b: Point;
}

contract DeepNested {
    seg: Segment;
    init() {
        self.seg = Segment{
            a: Point{ x: 1, y: 2 },
            b: Point{ x: 3, y: 4 },
        };
    }
}