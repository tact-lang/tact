struct OptionalsDefault {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NullDefaults {
    s: OptionalsDefault;
    init() {
        self.s = OptionalsDefault{};
    }
}