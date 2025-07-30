struct DefaultOpt {
    x: Int? = null;
    y: Bool? = null;
}

contract OptStructDefaults {
    s: DefaultOpt;

    init() {
        self.s = DefaultOpt{};
    }
}