struct InlineDefaults {
    val: Int = 42;
}

contract InlineDefaultsTest {
    s: InlineDefaults;

    init() {
        self.s = InlineDefaults{};
    }
}