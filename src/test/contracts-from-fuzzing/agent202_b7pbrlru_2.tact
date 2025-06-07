struct Point {
    x: Int;
    y: Int;
}

contract WithStruct {
    p: Point;
    init() {
        self.p = Point{ x: 1, y: 2 };
    }
    receive() {
        let _ = self.p.x + self.p.y;
    }
}