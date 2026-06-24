struct Point {
    x: Int;
    y: Int;
}

struct Rect {
    p1: Point;
    p2: Point;
}

contract CC {
    r: Rect;
    
    init() {
        self.r = Rect{
            p1: Point{ x: 0, y: 0 },
            p2: Point{ x: 10, y: 10 }
        };
    }
}