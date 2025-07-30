struct OptionalDeepDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract AllOptionalsDefaults {
    s: OptionalDeepDefaults;

    init() {
        self.s = OptionalDeepDefaults{};
    }
}