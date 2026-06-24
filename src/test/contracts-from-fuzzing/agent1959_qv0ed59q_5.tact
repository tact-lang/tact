struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Line {
    a: Point;
    b: Point;
}

contract SerializeContract {
    seg: Line;

    init() {
        self.seg = Line{
            a: Point{x:1,y:2},
            b: Point{x:3,y:4},
        };
    }
}