struct OptionalDefaults {
    n: Int? = null;
    s: String? = null;
    b: Bool? = null;
}

contract OptDefContract {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{};
    }
}