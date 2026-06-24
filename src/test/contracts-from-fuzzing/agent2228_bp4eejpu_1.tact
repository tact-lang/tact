struct Nested {
    a: Int;
    b: Int?;
}

contract NestedStructField {
    data: Nested;

    init() {
        self.data = Nested{a: 1, b: null};
    }
}
