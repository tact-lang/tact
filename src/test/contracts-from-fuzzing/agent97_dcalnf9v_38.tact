struct InlineDefaults {
    a: Int = 1;
    b: Bool = true;
}

contract InlineDefaultsContract {
    val: InlineDefaults;
    init() {
        self.val = InlineDefaults{};
    }
}