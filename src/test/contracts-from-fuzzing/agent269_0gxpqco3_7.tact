struct Point {
    x: Int = 0;
    y: Int = 0;
}

contract BigArrayContract {
    p1: Point = Point{};
    p2: Point = Point{};
    p3: Point = Point{};
    p4: Point = Point{};
    p5: Point = Point{};
    p6: Point = Point{};
    p7: Point = Point{};
    p8: Point = Point{};
    p9: Point = Point{};
    p10: Point = Point{};

    init() {
        self.p1 = Point{ x:1, y:2 };
        self.p10 = Point{ x:10, y:20 };
    }
}