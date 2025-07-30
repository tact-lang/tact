struct OptionalNestedDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: Address? = null;
    qux: Cell? = null;
    quux: Slice? = null;
    corge: String? = null;
}

contract WithDefaults {
    data: OptionalNestedDefaults;

    init() {
        self.data = OptionalNestedDefaults{};
    }
}