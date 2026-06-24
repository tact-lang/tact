struct Point {
    x: Int;
    y: Int;
}

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
}

struct AnnotatedRectangle {
    rect: Rectangle;
    label: String;
}

contract NestedStructsString {
    shape: AnnotatedRectangle;

    init() {
        self.shape = AnnotatedRectangle{
            rect: Rectangle{
                topLeft: Point{ x: 0, y: 0 },
                bottomRight: Point{ x: 5, y: 5 }
            },
            label: "data"
        };
    }
}