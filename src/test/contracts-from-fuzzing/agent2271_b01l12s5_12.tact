struct OptDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: Int? = 42;
}

contract DefaultedOptional {
    st: OptDefaults;

    init() {
        self.st = OptDefaults{};
    }
}