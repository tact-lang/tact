struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Triangle {
    p1: Point;
    p2: Point;
    p3: Point;
    label: String?;
}

contract ManyStructsNested {
    shape: Triangle;

    init() {
        self.shape = Triangle{
            p1: Point{ x: 0, y: 0 },
            p2: Point{ x: 1, y: 0 },
            p3: Point{ x: 0, y: 1 },
            label: null,
        };
    }
}
