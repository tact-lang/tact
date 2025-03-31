struct Point {
    x: Int;
    y: Int;
}

contract TestStruct {
    p: Point;
    
    init() {
         self.p = Point { x: 42, y: 24 };
    }
    
    receive() {
         dump(self.p.x + self.p.y); // Expected output: 66
    }
}
