struct Point { x: Int; y: Int; }

contract TestFieldAccess {
    receive() {
        // Create a Point struct instance
        let pt: Point = Point { x: 10, y: 20 };
        
        // Access field 'x'
        let xVal: Int = pt.x;
        
        // Nested expression: add fields
        let sum: Int = pt.x + pt.y;
        
        // More complex nested expression
        let complex: Int = (pt.x * 2) + (pt.y / 2);
    }
}
