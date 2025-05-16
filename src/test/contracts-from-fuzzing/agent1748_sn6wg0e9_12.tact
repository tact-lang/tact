struct OptionalDefaults {
    x: Int? = null;
    y: Bool? = null;
    s: String? = null;
}

contract TestContract {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{};
    }
}