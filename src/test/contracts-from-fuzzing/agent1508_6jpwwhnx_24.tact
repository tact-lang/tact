struct Point { x: Int; y: Int; }

struct Triangle {
    p1: Point;
    p2: Point;
    p3: Point;
}

contract TestContract {
    triangle: Triangle;

    init() {
        self.triangle = Triangle{
            p1: Point{x:0,y:0},
            p2: Point{x:1,y:0},
            p3: Point{x:0,y:1}
        };
    }
}