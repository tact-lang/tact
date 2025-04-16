struct OptionalStringDefault {
    val: String? = null;
}

contract OptionalDefaultNullTest {
    s: OptionalStringDefault;

    init() {
        self.s = OptionalStringDefault{}; // test default null applied
    }
}