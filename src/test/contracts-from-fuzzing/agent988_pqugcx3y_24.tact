struct DefaultOpt {
    a: Int? = null;
    b: String? = null;
}

contract OptDefaults {
    rec: DefaultOpt;

    init() {
        self.rec = DefaultOpt{};
    }
}