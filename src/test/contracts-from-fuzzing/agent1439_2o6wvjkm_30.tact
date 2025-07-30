struct DefaultOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDefaults {
    d: DefaultOpt;
    init() {
        self.d = DefaultOpt{};
    }
}