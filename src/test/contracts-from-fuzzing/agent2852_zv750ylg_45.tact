struct Point { x: Int; y: Int; }

struct Rect { a: Point; b: Point; }

contract ManyPoints {
    rect: Rect;

    init() {
        self.rect = Rect{
            a: Point{ x: 1, y: 2 },
            b: Point{ x: 3, y: 4 }
        };
    }
}