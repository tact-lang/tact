struct Point {
    x: Int;
    y: Int;
}

contract TestFieldAccess {
    receive() {
        let pt: Point = Point { x: 10, y: 20 };
        let sum: Int = pt.x + pt.y; // expected: 30
    }
}
