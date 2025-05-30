struct OptionalWithDefaults {
    x: Int? = null;
    y: Bool? = true;
}

contract TestOptWithDefaults {
    val: OptionalWithDefaults;

    init() {
        self.val = OptionalWithDefaults{};
    }
}
