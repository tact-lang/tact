struct Nested {
    x: Int = 1;
    y: Int?;
    z: Bool = true;
}

contract WithNested {
    field: Nested;

    init() {
        self.field = Nested{};
    }

    receive() {
        // do nothing
    }
}