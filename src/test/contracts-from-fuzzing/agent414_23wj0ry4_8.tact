struct Point {
    x: Int as int64;
    y: Int as int64;
    flag: Bool;
}

contract MixedSerializations {
    location: Point;
    status: Bool;

    init() {
        self.location = Point{ x: 100, y: 200, flag: true };
        self.status = false;
    }
}