struct Nested {
    pos: Pos;
    z: Int;
}

struct Pos {
    x: Int;
    y: Int;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            pos: Pos{ x: 4, y: 5 },
            z: 6,
        };
    }
}