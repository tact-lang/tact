struct Nested {
    x: Int;
    y: Int?;
}

contract StructStorage {
    s: Nested;

    init() {
        self.s = Nested{ x: 42, y: null };
    }
}