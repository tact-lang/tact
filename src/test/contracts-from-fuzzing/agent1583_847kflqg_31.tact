struct OptAndDefault {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
}

contract OptDefaults {
    data: OptAndDefault;

    init() {
        self.data = OptAndDefault{};
    }
}