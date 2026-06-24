struct Nested {
    x: Int;
    y: Int;
    z: Int?;
}

contract TestContract {
    nested: Nested;  // Persist nested struct as state
    init() {
        self.nested = Nested{ x: 1, y: 2, z: null };
    }
}