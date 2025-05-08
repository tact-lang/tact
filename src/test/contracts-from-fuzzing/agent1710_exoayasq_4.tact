struct Point { x: Int; y: Int }

struct Rect {
    topLeft: Point;
    bottomRight: Point;
    label: String?;
}

contract Test {
    r: Rect;

    init() {
        self.r = Rect{
            topLeft: Point{ x: 0, y: 0 },
            bottomRight: Point{ x: 10, y: 10 },
            label: null
        };
    }
}