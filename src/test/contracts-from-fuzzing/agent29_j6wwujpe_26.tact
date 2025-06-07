struct OptDefaults {
    o1: Int? = null;
    o2: Bool? = null;
    o3: String? = null;
}

contract OptionalsDefaults {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{};
    }
}