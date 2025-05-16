struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Rect {
    p1: Point;
    p2: Point;
    label: String;
    optLabel: String?;
}

contract SerialTest {
    data: Rect;

    init() {
        self.data = Rect{
            p1: Point{x:1,y:2},
            p2: Point{x:3,y:4},
            label: "rect",
            optLabel: null
        };
    }
}