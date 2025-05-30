struct RecPoint {
    x: Int;
    y: Int;
}

struct Rectangle {
    ul: RecPoint;
    lr: RecPoint;
}

contract TestContract {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{
            ul: RecPoint{ x: 0, y: 0 },
            lr: RecPoint{ x: 100, y: 50 }
        };
    }
}