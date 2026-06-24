struct Nested {
    s: String;
    o: Int?;
}

contract OptionalNullDefaults {
    n: Nested = Nested{ s: "x", o: null };

    init() {
        self.n = Nested{ s: "hello", o: null };
    }
}
