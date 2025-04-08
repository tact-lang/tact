struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDefContract {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{};
    }
}