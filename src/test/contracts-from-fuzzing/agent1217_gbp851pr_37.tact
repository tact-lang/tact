struct SDefaults {
    a: Int = 5;
    b: Bool = true;
}

contract EmbedDefaults {
    embed: SDefaults;

    init() {
        self.embed = SDefaults{};
    }
}