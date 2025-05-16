struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

struct Shape {
    l1: Line;
    l2: Line;
    center: Point;
}

contract GeometryContract {
    shape: Shape;

    init() {
        self.shape = Shape {
            l1: Line{ start: Point{x:0, y:0}, end: Point{x:1,y:1} },
            l2: Line{ start: Point{x:2,y:2}, end: Point{x:3,y:3} },
            center: Point { x:1, y:1 }
        };
    }
}