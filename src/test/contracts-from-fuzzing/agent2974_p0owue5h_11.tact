struct Point { x: Int; y: Int }

struct Rectangle {
    p1: Point;
    p2: Point;
    filled: Bool;
}

contract TestContract {
    shape: Rectangle;

    init() {
        self.shape = Rectangle{
            p1: Point{ x: 0, y: 0 },
            p2: Point{ x: 10, y: 10 },
            filled: true,
        };
    }
}