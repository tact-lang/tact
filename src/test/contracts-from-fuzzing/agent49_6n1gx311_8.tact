struct Point { x: Int; y: Int; }

contract TestFieldAccess {
    receive() {
        // Create a Point instance and access its fields
        let p: Point = Point { x: 10, y: 20 };
        dump(p.x + p.y); // Expected output: 30
    }
}
