struct OptionDefault {
    a: Int? = null;
}

contract TestOptDefaults {
    val: OptionDefault;
    init() {
        self.val = OptionDefault{};
    }
}