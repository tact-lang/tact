struct Nested {
    x: Int;
    y: Int;
}

contract StructFieldNested {
    coords: Nested;

    init() {
        self.coords = Nested{x: 1, y: 2};
    }

    receive() {
        self.coords = Nested{x: self.coords.x + 1, y: self.coords.y + 1};
    }
}