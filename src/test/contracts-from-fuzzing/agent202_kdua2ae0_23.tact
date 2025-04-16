struct OptionalWithDefaults {
    i: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract OptDefaultsStructStorage {
    val: OptionalWithDefaults;

    init() {
        self.val = OptionalWithDefaults{};
    }
}