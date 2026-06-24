struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{};
    }
}