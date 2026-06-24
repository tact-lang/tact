struct Nested {
    inner: Point;
    z: Int;
}

struct Point {
    x: Int;
    y: Int;
}

contract Test {
    n: Nested;

    init() {
        self.n = Nested{ inner: Point{ x: 2, y: 3 }, z: 4 };
    }
}