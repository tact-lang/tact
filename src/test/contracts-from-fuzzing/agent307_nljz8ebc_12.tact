struct InlineDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
    e: String?;
}

contract InlineDefaultTest {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{
            d: null,
            e: null,
        };
    }
}