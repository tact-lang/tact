struct OptionalWithDefaults {
    i: Int? = null;
    s: String? = null;
}

contract NestedOptionalDefaults {
    val: OptionalWithDefaults;

    init() {
        self.val = OptionalWithDefaults{};
    }
}