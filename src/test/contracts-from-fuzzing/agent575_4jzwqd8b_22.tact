struct Point { x: Int; y: Int; }
struct Rectangle { tl: Point; br: Point; }

contract TestContract {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{ tl: Point{ x:0, y:0 }, br: Point{ x:1, y:1 } };
    }
}
