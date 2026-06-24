struct Point {
    x: Int;
    y: Int;
}

struct Big {
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

contract Coordinates {
    vals: Big = Big{
        p1: Point{x:1,y:2},
        p2: Point{x:2,y:3},
        p3: Point{x:3,y:4},
        p4: Point{x:4,y:5},
        p5: Point{x:5,y:6},
        p6: Point{x:6,y:7},
        p7: Point{x:7,y:8},
        p8: Point{x:8,y:9},
        p9: Point{x:9,y:10},
        p10: Point{x:10,y:11},
    };
}