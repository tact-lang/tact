struct InlineDefaults {
    a: Int = 1;
    b: String = "x";
    c: Bool = false;
}

contract InlineDefaultTest {
    d: InlineDefaults;

    init() {
        self.d = InlineDefaults{};
    }
}