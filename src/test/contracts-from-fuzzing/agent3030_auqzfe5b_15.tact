struct InlineDefaults {
    a: Int = 7;
    b: Bool = false;
    c: String = "hi";
}

contract InlineDefaultsTest {
    val: InlineDefaults;

    init() {
        self.val = InlineDefaults{};
    }
}