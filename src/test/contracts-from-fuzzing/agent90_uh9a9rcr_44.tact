struct OptionalDefaults {
    x: Int? = null;
    y: Bool? = true;
    z: String? = "str";
}

contract OptionalDefaultsContract {
    data: OptionalDefaults;
    init() {
        self.data = OptionalDefaults{};
    }
}