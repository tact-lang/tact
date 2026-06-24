struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract TestContract {
    pos1: Point;
    pos2: Point;
    message: String;

    init() {
        self.pos1 = Point{ x: 100, y: 200 };
        self.pos2 = Point{ x: -100, y: -200 };
        self.message = "Positions";
    }
}