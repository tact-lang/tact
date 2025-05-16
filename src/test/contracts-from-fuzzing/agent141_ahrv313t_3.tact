struct Point {
    x: Int;
    y: Int;
}

struct Rect {
    a: Point;
    b: Point;
}

contract NestedStructs {
    shape: Rect;

    init() {
        self.shape = Rect{
            a: Point{ x: 0, y: 1 },
            b: Point{ x: 2, y: 3 },
        };
    }
}