struct Point { x: Int; y: Int; }
struct Circle { center: Point; radius: Int; }

contract Circles {
    one: Circle;
    two: Circle;

    init() {
        self.one = Circle{ center: Point{ x: 1, y: 2 }, radius: 3 };
        self.two = Circle{ center: Point{ x: 4, y: 5 }, radius: 6 };
    }
}