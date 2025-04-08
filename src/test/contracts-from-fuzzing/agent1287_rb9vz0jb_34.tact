// Test contract with many coordinates inside nested struct
struct Coord {
    x: Int;
    y: Int;
}

struct Shape {
    a: Coord;
    b: Coord;
    c: Coord;
    d: Coord;
    e: Coord;
    f: Coord;
}

contract TestContract {
    polygon: Shape;
    init() {
        self.polygon = Shape{
            a: Coord{x:1,y:2},
            b: Coord{x:3,y:4},
            c: Coord{x:5,y:6},
            d: Coord{x:7,y:8},
            e: Coord{x:9,y:10},
            f: Coord{x:11,y:12},
        };
    }
}