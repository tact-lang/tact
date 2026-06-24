struct OptionalDefaults {
    s: String? = null;
    n: Int? = null;
    b: Bool? = null;
}

contract DefaultsContract {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{};
    }
}