struct Point {
    x: Int;
    y: Int = 100;
}

contract TestContract {
    p: Point = Point{x: 5};

    init() {}

    receive() {
        dump(self.p.x);
        dump(self.p.y);
    }
}