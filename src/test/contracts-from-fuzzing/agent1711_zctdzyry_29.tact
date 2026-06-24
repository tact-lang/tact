struct Point { x: Int; y: Int; }
struct Circle { center: Point; radius: Int; }

contract Geometry {
    circ: Circle;

    init() {
        self.circ = Circle{
            center: Point{ x:0, y:0 },
            radius: 10
        };
    }
}