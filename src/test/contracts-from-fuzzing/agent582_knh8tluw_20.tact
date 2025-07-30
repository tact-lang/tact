struct OptionalAndDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String = "default string";
}

contract OptDefStorage {
    s: OptionalAndDefaults;

    init() {
        self.s = OptionalAndDefaults{};
    }
}
