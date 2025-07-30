struct Point { x: Int; y: Int }
struct Circle { center: Point; radius: Int }
struct Rectangle { a: Point; b: Point }

contract Geometry {
    circ: Circle;
    rect: Rectangle;

    init() {
        self.circ = Circle{ center: Point{ x:0, y:0 }, radius:10 };
        self.rect = Rectangle{ a:Point{x:1,y:1}, b:Point{x:2,y:2} };
    }
}