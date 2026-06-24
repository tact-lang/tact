// nested structs with serialization annotations on primitive fields
struct Point {
    x: Int as int32;
    y: Int as int32;
}

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
}

contract TestContract {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{
            topLeft: Point{ x:-10, y:20 },
            bottomRight: Point{ x:30, y:-40 }
        };
    }
}