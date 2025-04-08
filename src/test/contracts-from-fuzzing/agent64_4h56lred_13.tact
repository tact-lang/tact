struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
    d: Address? = null;
}

contract OptionalDefaultsTest {
    state: OptionalWithDefaults = OptionalWithDefaults{};
}