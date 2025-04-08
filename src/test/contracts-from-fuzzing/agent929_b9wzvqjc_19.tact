struct OptionalWithDefault {
    num: Int? = null;
    flag: Bool? = null;
}

contract OptDefaults {
    f: OptionalWithDefault;
    init() {
        self.f = OptionalWithDefault{};
    }
}