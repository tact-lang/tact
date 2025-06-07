struct OptDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract OptionalWithDefaults {
    val: OptDefaults;

    init() {
        self.val = OptDefaults{};
    }
}