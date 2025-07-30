struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

struct Shape {
    line1: Line;
    line2: Line;
}

contract NestedShapeContract {
    shape: Shape;

    init() {
        self.shape = Shape{
            line1: Line{
                start: Point{x: 1, y: 1},
                end: Point{x: 2, y: 2},
            },
            line2: Line{
                start: Point{x: 3, y: 3},
                end: Point{x: 4, y: 4},
            },
        };
    }
}