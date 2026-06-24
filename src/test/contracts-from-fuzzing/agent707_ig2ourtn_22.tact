struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Cell? = null;
}

contract OptDefTest {
    s: OptionalDefaults;
    init() {
        self.s = OptionalDefaults{};
    }
}