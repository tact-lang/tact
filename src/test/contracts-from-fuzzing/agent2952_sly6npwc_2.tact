struct Nested {
    flag: Bool;
    value: Int;
}

contract NestedStructField {
    nested: Nested;

    init() {
        self.nested = Nested{flag: true, value: 42};
    }
}