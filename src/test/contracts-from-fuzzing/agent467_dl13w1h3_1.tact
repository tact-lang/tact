struct Nested {
    flag: Bool;
    count: Int;
}

contract NestedStructField {
    data: Nested;

    init() {
        self.data = Nested{flag: true, count: 42};
    }
}
