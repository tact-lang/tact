struct Point {
    x: Int as int64;
    y: Int as int64;
    z: Int as int64;
}

contract TestContract {
    p: Point;

    init() {
        self.p = Point{ x:1, y:2, z:3 };
    }
}