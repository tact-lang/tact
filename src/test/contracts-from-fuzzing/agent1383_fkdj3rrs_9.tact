struct OptionalWithDefaults {
    id: Int? = null;
    text: String? = null;
    flag: Bool? = null;
}

contract OptionalDefaultsContract {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}
