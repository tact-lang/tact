struct AllOptional {
    a: Int?;
    b: String?;
    c: Address?;
    d: Bool?;
}

contract AllOptionalStructTest {
    store: AllOptional;

    init() {
        self.store = AllOptional{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}
