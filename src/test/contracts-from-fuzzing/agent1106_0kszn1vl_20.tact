struct SDefaults {
    one: Int = 1;
    two: String = "";
    three: Bool = false;
}

contract ImplicitStructDefaults {
    holder: SDefaults;

    init() {
        self.holder = SDefaults{};
    }
}