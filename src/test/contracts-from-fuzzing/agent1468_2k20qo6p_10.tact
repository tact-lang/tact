struct OptionalDefault {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestOptionalDefault {
    data: OptionalDefault;

    init() {
        self.data = OptionalDefault{};
    }
}
