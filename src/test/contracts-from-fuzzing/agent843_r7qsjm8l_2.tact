struct Nested {
    a: Int;
    b: Int?;
}

contract WithNested {
    data: Nested;

    init() {
        self.data = Nested{ a: 7, b: null };
    }
}