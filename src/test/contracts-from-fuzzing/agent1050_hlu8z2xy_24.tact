struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefaultsInOptionalStruct {
    val: OptionalWithDefaults;

    init() {
        self.val = OptionalWithDefaults{};
    }
}
