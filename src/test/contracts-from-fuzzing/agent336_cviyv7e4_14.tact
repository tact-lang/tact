struct Point {
    x: Int;
    y: Int;
}

struct Box {
    topLeft: Point;
    bottomRight: Point;
}

contract TestContract {
    b: Box;

    init() {
        self.b = Box{
            topLeft: Point{ x: 0, y: 0 },
            bottomRight: Point{ x: 100, y: 100 }
        };
    }
}