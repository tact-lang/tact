struct Point {
    x: Int;
    y: Int;
}

contract TestStructInstantiation {
    fun showcase() {
        // Instantiate a struct and access its fields.
        // Expected: 10 + 20 equals 30.
        let p: Point = Point{ x: 10, y: 20 };
        dump(p.x + p.y);
    }
    
    receive() {
        self.showcase();
    }
}
