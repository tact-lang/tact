struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptionalWithDefaults {
    val: OptionalDefaults;

    init() {
        self.val = OptionalDefaults{};
    }
}
