struct OptionalDefaults {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
}

contract OptDefTest {
    odd: OptionalDefaults = OptionalDefaults{};

    init() {
        self.odd = OptionalDefaults{};
    }
}