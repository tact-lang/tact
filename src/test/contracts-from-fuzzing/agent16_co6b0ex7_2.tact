struct Nested {
    x: Int;
    y: Int;
}

contract NestedField {
    point: Nested;

    init() {
        self.point = Nested{
            x: 7,
            y: 8,
        };
    }
}