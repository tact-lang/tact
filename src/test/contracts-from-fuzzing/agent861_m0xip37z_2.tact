struct Nested {
    inner: Int;
}

contract WithStructField {
    data: Nested;

    init() {
        self.data = Nested{ inner: 42 };
    }
}
