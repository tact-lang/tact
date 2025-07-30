struct OptionalDefaulted {
    foo: Int? = null;
    bar: Bool? = null;
}

contract OptionalDefaultedField {
    data: OptionalDefaulted;

    init() {
        self.data = OptionalDefaulted{};
    }
}