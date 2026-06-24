struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "default";
}
contract OptDefaults {
    f: OptionalWithDefaults;
    init() {
        self.f = OptionalWithDefaults{};
    }
}