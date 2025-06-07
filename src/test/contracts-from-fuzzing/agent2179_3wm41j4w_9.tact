struct Point { x: Int; y: Int; }

struct Polygon {
    p1: Point;
    p2: Point;
    p3: Point;
    p4: Point;
    p5: Point;
}

contract NestedLargeStruct {
    shape: Polygon;

    init() {
        self.shape = Polygon{
            p1: Point{ x:1, y:1 },
            p2: Point{ x:2, y:2 },
            p3: Point{ x:3, y:3 },
            p4: Point{ x:4, y:4 },
            p5: Point{ x:5, y:5 }
        };
    }
}