struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
}

contract OptDefaults {
    val: OptionalWithDefaults;

    init() {
        self.val = OptionalWithDefaults{};
    }
}