struct OptionalDefaults {
    a: Int? = null;
    b: String? = null;
    c: Address? = null;
}

contract OptionalDefaultsContract {
    defaults: OptionalDefaults;

    init() {
        self.defaults = OptionalDefaults{};
    }
}