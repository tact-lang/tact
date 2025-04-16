struct OptionalDefaults {
    n: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract TestContract {
    optdef: OptionalDefaults;

    init() {
        self.optdef = OptionalDefaults{};
    }
}