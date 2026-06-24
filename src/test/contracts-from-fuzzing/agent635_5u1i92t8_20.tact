struct EmbeddedDefaults {
    a: Int = 1;
    b: Bool = false;
}

contract DefaultsIndirectly {
    val: EmbeddedDefaults;

    init() {
        self.val = EmbeddedDefaults{};
    }
}