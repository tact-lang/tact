struct OptionalNestedDefault {
    optional: Int? = null;
    optionalBool: Bool? = true;
}

contract OptionalNestedDefaultTest {
    storage: OptionalNestedDefault;

    init() {
        self.storage = OptionalNestedDefault{};
    }
}