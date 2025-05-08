struct Point { x: Int = 1; y: Int = 2; }

contract Getters {
    p: Point = Point{};

    get fun xVal(): Int { return self.p.x; }

    get fun yVal(): Int { return self.p.y; }
}