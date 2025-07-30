struct OptionalDefaults {
    x: Int? = null;
    y: Bool? = true;
    z: String? = "foo";
}

contract OptionalWithDefValues {
    data: OptionalDefaults;
    init() {
        self.data = OptionalDefaults{};
    }
}