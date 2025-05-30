struct Point {
    x: Int;
    y: Int;
}

contract DuplicateStructs {
    p1: Point;
    p2: Point;

    init() {
        self.p1 = Point{ x: 3, y: 5 };
        self.p2 = Point{ x: 7, y: 11 };
    }
}