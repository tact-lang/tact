struct Point {
    x: Int;
    y: Int;
}

struct Shape {
    center: Point;
    color: String;
    label: String?;
}

contract Geometry {
    shape: Shape;

    init() {
        self.shape = Shape{
            center: Point{ x: 5, y: 7 },
            color: "red",
            label: null,
        };
    }
}