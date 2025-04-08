struct InlineOnlyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "text";
}

contract DefaultInitialized {
    v: InlineOnlyDefaults;

    init() {
        self.v = InlineOnlyDefaults{};
    }
}