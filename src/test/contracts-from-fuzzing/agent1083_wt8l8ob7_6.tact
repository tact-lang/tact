struct Point {
    x: Int;
    y: Int;
}

struct Polyline {
    p1: Point;
    p2: Point;
    p3: Point;
    p4: Point;
    p5: Point;
    p6: Point;
    p7: Point;
    p8: Point;
    p9: Point;
    p10: Point;
}

contract LongStructStruct {
    poly: Polyline;

    init() {
        self.poly = Polyline{
            p1: Point{x:1,y:1}, p2: Point{x:2,y:2}, p3: Point{x:3,y:3},
            p4: Point{x:4,y:4}, p5: Point{x:5,y:5}, p6: Point{x:6,y:6},
            p7: Point{x:7,y:7}, p8: Point{x:8,y:8}, p9: Point{x:9,y:9},
            p10: Point{x:10,y:10}
        };
    }
}