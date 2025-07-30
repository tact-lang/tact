struct Coord {
    x: Int as int32;
    y: Int as int32;
}

struct Polygon {
    p1: Coord;
    p2: Coord;
    p3: Coord;
    p4: Coord;
    p5: Coord;
    p6: Coord;
    p7: Coord;
    p8: Coord;
}

contract Test6 {
    shape: Polygon;

    init() {
        self.shape = Polygon{
            p1: Coord{x:1,y:1},
            p2: Coord{x:2,y:2},
            p3: Coord{x:3,y:3},
            p4: Coord{x:4,y:4},
            p5: Coord{x:5,y:5},
            p6: Coord{x:6,y:6},
            p7: Coord{x:7,y:7},
            p8: Coord{x:8,y:8},
        };
    }
}