struct Nested {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract OptionalNestedTest {
    nested: Nested;

    init() {
        self.nested = Nested{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}