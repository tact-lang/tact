struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Int? = 5;
    d: Bool? = true;
}

contract TestContract {
    opts: OptionalDefaults;

    init() {
        self.opts = OptionalDefaults{};
    }
}