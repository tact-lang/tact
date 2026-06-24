struct Point { x: Int; y: Int }
struct Circle { center: Point; radius: Int }

contract Test {
    circ: Circle?;
    init() {
        self.circ = Circle{ center: Point{ x: 0, y: 0 }, radius: 10 };
    }
    receive() {
        let _ = self.circ;
    }
}