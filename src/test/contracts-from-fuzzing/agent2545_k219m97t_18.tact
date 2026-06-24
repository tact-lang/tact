struct Point {
    x: Int;
    y: Int;
}

struct Rectangle {
    start: Point;
    end: Point;
}

struct Shape {
    r: Rectangle;
}

contract NestedShapeTest {
    s: Shape;

    init() {
        self.s = Shape{
            r: Rectangle{
                start: Point{x:0,y:0},
                end: Point{x:10,y:10}
            }
        };
    }
}
