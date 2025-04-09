struct Point { x: Int; y: Int; }
struct Circle { center: Point; radius: Int; }
struct Rectangle { topLeft: Point; bottomRight: Point; }

contract Shapes {
    circ: Circle;
    rect: Rectangle;

    init() {
        self.circ = Circle{ center: Point{ x: 0, y: 0 }, radius: 10 };
        self.rect = Rectangle{
            topLeft: Point{ x: -5, y: 5 },
            bottomRight: Point{ x: 5, y: -5 }
        };
    }
}