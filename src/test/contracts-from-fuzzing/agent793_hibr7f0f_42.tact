struct EmbeddedDefaults {
    x: Int = 1;
    y: Bool = true;
}

contract EmbeddedWithDefaults {
    ed: EmbeddedDefaults;
    init() {
        self.ed = EmbeddedDefaults{};
    }
}