struct Point { x: Int; y: Int; }

extends fun distance(self: Point): Int {
    // Calculate squared distance and mod it to avoid overflow in this test
    return (self.x * self.x + self.y * self.y) % 100;
}

contract TestPoint() {
    // Getter that returns the computed distance for a sample point
    get fun test(): Int {
        let p: Point = Point{ x: 3, y: 4 };
        return p.distance(); // Expected: (9 + 16) % 100 = 25
    }
}
