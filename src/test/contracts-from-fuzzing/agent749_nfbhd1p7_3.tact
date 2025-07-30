struct Point {
    x: Int;
    y: Int;
}

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
}

contract TestContract {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{
            topLeft: Point{x:0, y:0},
            bottomRight: Point{x:100, y:100},
        };
    }

    receive() {
        let _ = self.rect.topLeft.x;
    }
}