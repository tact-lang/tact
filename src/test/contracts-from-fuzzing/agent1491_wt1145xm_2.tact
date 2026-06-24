struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedStructField {
    data: Nested;

    init() {
        self.data = Nested{ a: 5, b: true, c: "hello" };
    }
}