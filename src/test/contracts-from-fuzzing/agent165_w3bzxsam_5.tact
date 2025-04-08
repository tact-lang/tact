struct Nested {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract MultiOptional {
    data: Nested;

    init() {
        self.data = Nested{ a: null, b: null, c: null };
    }
}