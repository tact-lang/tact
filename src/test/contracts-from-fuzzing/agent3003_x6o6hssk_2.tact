struct Nested {
    x: Int;
    y: Int;
}

contract NestedStructField {
    point: Nested;

    init() {
        self.point = Nested{ x: 1, y: 2 };
    }
}
