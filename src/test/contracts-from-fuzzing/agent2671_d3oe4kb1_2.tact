struct Nested {
    inner: Coordinates;
    z: Int;
}

struct Coordinates {
    x: Int;
    y: Int;
}

contract NestedStructContract {
    pos: Nested;

    init() {
        self.pos = Nested{
            inner: Coordinates{ x: 1, y: 2 },
            z: 3
        };
    }
}