struct Point {
    x: Int;
    y: Int as int64;
}

struct Shape {
    p1: Point;
    p2: Point;
}

contract NestedSerializedStruct {
    field: Shape;
    init() {
        self.field = Shape{
            p1: Point{x:1,y:2},
            p2: Point{x:3,y:4}
        };
    }
}