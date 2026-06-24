struct Nested {
    point: Point;
    maybe: Optionals;
}

struct Optionals {
    x: Int?;
    y: Bool?;
    text: String?;
}

struct Point {
    x: Int;
    y: Int;
}

contract TestFuzz {
    data: Nested;

    init() {
        self.data = Nested{
            point: Point{ x: 1, y: 2 },
            maybe: Optionals{ x: null, y: true, text: "hello" }
        };
    }
}