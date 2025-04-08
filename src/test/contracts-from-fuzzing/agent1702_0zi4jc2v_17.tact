struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Rect {
    topLeft: Point;
    bottomRight: Point;
}

contract TestContract {
    r: Rect;

    init() {
        self.r = Rect{
            topLeft: Point{x:0,y:0},
            bottomRight: Point{x:1000,y:1000}
        };
    }
}