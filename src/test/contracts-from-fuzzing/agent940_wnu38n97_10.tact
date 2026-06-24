struct OptionalDefaults {
    i: Int? = null;
    b: Bool? = null;
}

contract TestContract {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{};
    }
}