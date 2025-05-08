struct EmbedWithDefaults {
    a: Int = 1;
    b: Bool = true;
}

contract TestContract {
    e: EmbedWithDefaults;

    init() {
        self.e = EmbedWithDefaults{};
    }
}