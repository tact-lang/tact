struct Point {
    x: Int as uint32;
    y: Int as int64;
}

contract Serializations {
    p: Point = Point{x: 123, y: -456};

    init() {
        self.p = Point{x: 789, y: -321};
    }
}