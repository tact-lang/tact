struct OptionalPrimitiveWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract OptionalDefaultTest {
    val: OptionalPrimitiveWithDefaults;

    init() {
        self.val = OptionalPrimitiveWithDefaults{};
    }
}