struct Point {
    x: Int;
    y: Int;
}

struct Shape {
    origin: Point;
    filled: Bool;
}

contract DeepNestedTest {
    shape: Shape;

    init() {
        self.shape = Shape{origin: Point{x: 1, y: 2}, filled: true};
    }
}