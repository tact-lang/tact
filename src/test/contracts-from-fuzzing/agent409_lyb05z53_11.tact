struct OptionalWithDefaults {
    x: Int? = null;
    y: Bool? = null;
    z: Address? = null;
}

contract OptionalDefaultsContract {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}