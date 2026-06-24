struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract OptionalDefaultsContract {
    val: OptionalWithDefaults;

    init() {
        self.val = OptionalWithDefaults{};
    }
}