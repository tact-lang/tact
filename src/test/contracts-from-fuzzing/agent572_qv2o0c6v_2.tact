struct Nested {
    a: Int;
    b: Bool;
}

contract NestedStructField {
    s: Nested;
    init() {
        self.s = Nested{ a: 42, b: true };
    }
}