struct OptionalNestedDefault {
    a: Int? = null;
    b: Bool? = null;
}

contract TestContract {
    field: OptionalNestedDefault;

    init() {
        self.field = OptionalNestedDefault{};
    }
}