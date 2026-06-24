struct Point {
    x: Int;
    y: Int;
}

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
}

struct Shape {
    id: Int;
    name: String;
    color: String;
    boundingBox: Rectangle;
}

contract NestedStructContract {
    shape: Shape;

    init() {
        self.shape = Shape{
            id: 1,
            name: "square",
            color: "red",
            boundingBox: Rectangle{
                topLeft: Point{ x: 0, y: 0 },
                bottomRight: Point{ x: 10, y: 10 }
            }
        };
    }
}