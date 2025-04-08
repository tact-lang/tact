struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: String? = null;
}

contract TestContract {
    f: OptionalDefaults;

    init() {
        self.f = OptionalDefaults{};
    }

    receive() {
        dump(0);
    }
}