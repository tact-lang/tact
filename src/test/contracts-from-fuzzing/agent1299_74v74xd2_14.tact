struct OptionalStructWithDefaults {
    x: Int? = null;
    y: Bool? = null;
    addr: Address? = null;
}

contract OptionalDefaultsHolder {
    point: OptionalStructWithDefaults;

    init() {
        self.point = OptionalStructWithDefaults{};
    }
}
