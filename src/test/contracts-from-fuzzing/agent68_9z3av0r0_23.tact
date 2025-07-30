struct OptionDefault {
    x: Int? = null;
}

contract OptionDefaultContract {
    s: OptionDefault;

    init() {
        self.s = OptionDefault{};
    }
}