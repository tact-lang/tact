struct OptionalWithDefaults {
    flag: Bool? = null;
    num: Int? = null;
    text: String? = null;
}

contract DefaultOptionals {
    store: OptionalWithDefaults;

    init() {
        self.store = OptionalWithDefaults{};
    }
}
