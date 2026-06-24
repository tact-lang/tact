struct OnlyDefaults {
    a: Int = 5;
    b: String = "default";
    c: Bool = true;
}

contract StructAllDefaults {
    s: OnlyDefaults;

    init() {
        self.s = OnlyDefaults{};
    }
}