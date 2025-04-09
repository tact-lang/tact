struct MixDefaults {
    opt1: String? = "X";
    opt2: String? = null;
    opt3: String? = "Y";
}

contract OptionalWithDefaults {
    d: MixDefaults;
    init() {
        self.d = MixDefaults{};
    }
}