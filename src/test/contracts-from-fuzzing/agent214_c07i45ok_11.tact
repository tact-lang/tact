struct Point { x: Int; y: Int; }

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
}

struct Frame {
    border: Rectangle;
    label: String;
}

contract TestContract {
    frame: Frame;

    init() {
        self.frame = Frame{
            border: Rectangle{
                topLeft: Point{ x: 0, y: 0 },
                bottomRight: Point{ x: 10, y: 10 },
            },
            label: "box",
        };
    }
}