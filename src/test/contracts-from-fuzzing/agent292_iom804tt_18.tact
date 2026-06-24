struct Point { x: Int; y: Int }

struct Rect {
    origin: Point;
    size: Point;
}

contract NestedStructs {
    rect: Rect;

    init() {
        self.rect = Rect{
            origin: Point{ x:0, y:0 },
            size: Point{ x:100, y:200 }
        };
    }
}