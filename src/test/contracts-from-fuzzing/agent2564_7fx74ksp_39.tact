struct InnerWithDefaults {
    a: Int = 5;
    b: Bool = false;
}

contract EmbedDefaults {
    val: InnerWithDefaults;

    init() {
        self.val = InnerWithDefaults{};
    }
}