struct Point { x: Int; y: Int; }

contract TestStructInstantiation {
    fun run() {
        // Instantiate a struct and access its fields
        let p: Point = Point{ x: 10, y: 20 };
        // Expected output: 10
        dump(p.x);
        // Expected output: 20
        dump(p.y);
    }
    receive() {
         self.run();
    }
}
