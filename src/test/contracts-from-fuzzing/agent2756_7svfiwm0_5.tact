struct Point {
    x: Int;
    y: Int;
}

struct Shape {
    p1: Point;
    p2: Point?;
}

contract NestedOptionals {
    shape1: Shape?;
    shape2: Shape;

    init() {
        self.shape1 = null;
        self.shape2 = Shape{
            p1: Point{ x: 1, y: 2 },
            p2: null
        };
    }
}