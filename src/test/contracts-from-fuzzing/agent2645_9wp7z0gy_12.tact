struct OptionalStringDefault {
    foo: String? = null;
}

contract OptionalDefaultTest {
    data: OptionalStringDefault;

    init() {
        self.data = OptionalStringDefault{};
    }
}
