struct Nested {
    a: Int;
    b: Int?;
}

contract Test {
    myField: Nested;

    init() {
        self.myField = Nested{ a: 1, b: null };
    }
}
