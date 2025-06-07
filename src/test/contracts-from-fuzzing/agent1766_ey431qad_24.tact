struct OptionalDefaults {
    x: Int? = null;
    y: String? = null;
}

contract OptionalDefaultsStruct {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{};
    }
}
