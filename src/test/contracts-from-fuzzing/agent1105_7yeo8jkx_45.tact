struct Point { x: Int; y: Int; }

struct Shape {
    p1: Point;
    p2: Point;
    p3: Point;
    label: String;
}

contract Geometry {
    triangle: Shape;
    init() {
        self.triangle = Shape{
            p1: Point{x:0,y:0},
            p2: Point{x:1,y:0},
            p3: Point{x:0,y:1},
            label: "t"
        };
    }
}