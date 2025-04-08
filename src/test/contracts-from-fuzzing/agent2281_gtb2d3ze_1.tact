struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract TestStorage {
    field: Nested;

    init() {
        self.field = Nested{ a: 1, b: true, c: "abc" };
    }
}