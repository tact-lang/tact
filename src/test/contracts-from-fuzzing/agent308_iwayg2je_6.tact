struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDefTest {
    df: OptionalDefaults;

    init() {
        self.df = OptionalDefaults{};
    }
}