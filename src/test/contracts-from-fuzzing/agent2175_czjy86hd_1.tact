contract NestedStructSimple {
    data: Point;
    
    init() {
        self.data = Point{ x: 1, y: 2 };
    }
}

struct Point {
    x: Int;
    y: Int;
}