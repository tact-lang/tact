struct OptionalNestedDefault {
    inner: Int? = null;
}

contract ONDTest {
    on: OptionalNestedDefault;

    init() {
        self.on = OptionalNestedDefault{};
    }
}