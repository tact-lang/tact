struct Point {
    x: Int;
    y: Int;
}

struct Poly {
    p1: Point;
    p2: Point;
    p3: Point;
    p4: Point;
}

contract Polygon {
    data: Poly;

    init() {
        self.data = Poly{
            p1: Point{ x:0, y:0 },
            p2: Point{ x:0, y:10 },
            p3: Point{ x:10,y:10 },
            p4: Point{ x:10,y:0 }
        };
    }
}