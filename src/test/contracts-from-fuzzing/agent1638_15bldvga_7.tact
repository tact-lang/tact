struct Point { x: Int; y: Int }

contract InitStructVar {
    pt: Point;
    init() {
        self.pt = Point{ x: 5, y: 10 };
    }
}