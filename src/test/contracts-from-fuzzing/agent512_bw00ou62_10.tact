struct InlineDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "test";
}

contract InlineDefaultsTest {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}
