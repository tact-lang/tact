struct Nested {
    n: Int;
}

contract StructField {
    field: Nested;

    init() {
        self.field = Nested{n: 42};
    }
}