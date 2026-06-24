struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = true;
    str: String? = "hello";
}

contract OptDefaults {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{};
    }
}