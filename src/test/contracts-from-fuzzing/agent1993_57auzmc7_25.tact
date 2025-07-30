struct EmbedOptDefaults {
    a: Int? = null;
    b: Bool? = null;
}

contract TestContract {
    e: EmbedOptDefaults;

    init() {
        self.e = EmbedOptDefaults{};
    }
}