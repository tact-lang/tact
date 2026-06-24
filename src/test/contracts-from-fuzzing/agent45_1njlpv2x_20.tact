struct InlineDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "abc";
}

contract InlineDefaultsTest {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}
