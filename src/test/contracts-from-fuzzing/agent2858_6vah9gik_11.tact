struct Nested {
    point: Point;
}

struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            point: Point{ x: 1, y: 2 }
        };
    }
}