struct Nested {
    inner: Int;
}

contract NestedStructField {
    value: Nested;

    init() {
        self.value = Nested{ inner: 10 };
    }
}