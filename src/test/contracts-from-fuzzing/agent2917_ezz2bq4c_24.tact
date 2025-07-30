struct OptionalNestedWithDefaults {
    a: Inner? = null;
}

struct Inner {
    val: Int = 5;
}

contract OptionalDefaultsField {
    field: OptionalNestedWithDefaults;

    init() {
        self.field = OptionalNestedWithDefaults{};
    }
}
