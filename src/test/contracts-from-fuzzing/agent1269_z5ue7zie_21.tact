struct Point {
    x: Int;
    y: Int;
}

struct Line {
    a: Point;
    b: Point;
}

struct Triangle {
    v1: Point;
    v2: Point;
    v3: Point;
}

contract TestContract {
    segment: Line;
    shape: Triangle;

    init() {
        self.segment = Line{a:Point{x:0,y:0}, b:Point{x:1,y:1}};
        self.shape = Triangle{
            v1: Point{x:0,y:0},
            v2: Point{x:1,y:0},
            v3: Point{x:0,y:1}
        };
    }
}