struct Nested1 {
    a: Int;
    b: Int?;
}

contract NestedStructField {
    s: Nested1;

    init() {
        self.s = Nested1{ a: 1, b: null };
    }
}
