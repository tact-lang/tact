struct OptionalStringDefault {
    s: String? = null;
}

contract OptionalStringDefaultTest {
    state: OptionalStringDefault;

    init() {
        self.state = OptionalStringDefault{};
    }
}
