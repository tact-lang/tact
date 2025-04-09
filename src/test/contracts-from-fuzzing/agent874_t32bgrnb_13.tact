struct Coord {
    x: Int as int32;
    y: Int as int32;
}

struct Shape {
    tl: Coord;
    br: Coord;
}

contract ShapeStore {
    shape: Shape;
    init() {
        self.shape = Shape{
            tl: Coord{x:0,y:0},
            br: Coord{x:100,y:50},
        };
    }
}