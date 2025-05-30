struct DeepNest {
    n: Nested;
    val: Int;
}

struct Nested {
    p: Point;
}

struct Point {
    x: Int;
    y: Int;
}

contract Test {
    d: DeepNest;

    init() {
        self.d = DeepNest{
            n: Nested{ p: Point{ x:1, y:2 } },
            val: 7
        };
    }
}