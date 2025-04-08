struct InlineDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: String? = null;
    f: Bool? = null;
}

contract InlineDefaultTest {
    s: InlineDefaults;
    init() {
        self.s = InlineDefaults{};
    }
}