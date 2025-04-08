struct DeepOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    defaults: DeepOptionalDefaults;

    init() {
        self.defaults = DeepOptionalDefaults{};
    }
}