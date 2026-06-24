struct Nested {
    inner: Int;
}

contract StructField {
    data: Nested;

    init() {
        self.data = Nested{ inner: 42 };
    }
}
