struct Point {
    x: Int;
    y: Int;
}

contract Test {
    a: Point;
    b: Point;
    c: Point;
    d: Point;
    e: Point;

    init() {
        self.a = Point{ x: 1, y: 2 };
        self.b = Point{ x: 3, y: 4 };
        self.c = Point{ x: 5, y: 6 };
        self.d = Point{ x: 7, y: 8 };
        self.e = Point{ x: 9, y: 10 };
    }
}