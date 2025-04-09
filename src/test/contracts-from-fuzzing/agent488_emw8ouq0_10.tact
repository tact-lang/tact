struct Point {
    x: Int;
    y: Int;
}

struct Rect {
    p1: Point;
    p2: Point;
}

struct ShapeWrapper {
    r1: Rect;
    r2: Rect;
    text: String;
}

contract MultiNestedStructFields {
    shape: ShapeWrapper;

    init() {
        self.shape = ShapeWrapper{
            r1: Rect{p1: Point{x:0,y:0}, p2: Point{x:1,y:1}},
            r2: Rect{p1: Point{x:2,y:2}, p2: Point{x:3,y:3}},
            text: "text"
        };
    }
}