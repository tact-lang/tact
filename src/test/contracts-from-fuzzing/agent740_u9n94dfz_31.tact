struct OptionalAddressDefaults {
    a1: Address? = null;
    a2: Address? = null;
}

contract OptionalAddressDefaultsTest {
    data: OptionalAddressDefaults;

    init() {
        self.data = OptionalAddressDefaults{};
    }
}