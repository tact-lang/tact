struct InlineDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "ok";
}

contract InlineDefaultTest {
    store: InlineDefaults;

    init() {
        self.store = InlineDefaults{};
    }
}