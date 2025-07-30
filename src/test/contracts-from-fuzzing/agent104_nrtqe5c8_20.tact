struct EmbedDefaults {
    a: Int = 1;
    b: String = "default";
}

contract StructEmbedDefaults {
    x: EmbedDefaults;

    init() {
        self.x = EmbedDefaults{};
    }
}