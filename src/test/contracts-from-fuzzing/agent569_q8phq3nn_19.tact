struct Point { x: Int; y: Int; }
struct Rectangle {
    origin: Point;
    size: Point;
}

contract TestContract {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{
            origin: Point{x: 0,y:0},
            size: Point{x: 100, y: 200}
        };
    }
}