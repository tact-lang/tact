struct Nested {
    x: Int;
    y: Int;
}

contract StructNestedField {
    point: Nested;

    init() {
        self.point = Nested{ x: 1, y: 2 };
    }
}