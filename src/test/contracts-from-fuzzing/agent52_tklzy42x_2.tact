struct Nested {
    a: Int;
    b: Int?;
    c: Bool;
}

contract NestedStorage {
    data: Nested;

    init() {
        self.data = Nested{ a: 10, b: null, c: true };
    }
}