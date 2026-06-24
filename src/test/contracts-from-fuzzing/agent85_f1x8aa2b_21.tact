struct OptionalsDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract OptDefaultsState {
    x: OptionalsDefaults;

    init() {
        self.x = OptionalsDefaults{};
    }

    receive() {}
}