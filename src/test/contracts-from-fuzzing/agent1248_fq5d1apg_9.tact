struct Point {
    x: Int as int32;
    y: Int as int32;
    z: Int as int32;
}

struct Container {
    p1: Point;
    p2: Point;
    p3: Point;
    p4: Point;
    p5: Point;
}

contract MultiStructStorage {
    c: Container;

    init() {
        self.c = Container{
            p1: Point{x:1,y:2,z:3},
            p2: Point{x:4,y:5,z:6},
            p3: Point{x:7,y:8,z:9},
            p4: Point{x:10,y:11,z:12},
            p5: Point{x:13,y:14,z:15}
        };
    }
}
