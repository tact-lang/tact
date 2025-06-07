struct OptionalStructWithDefaults {
    i: Int? = null;
    b: Bool? = null;
    s: Slice? = null;
    c: Cell? = null;
    a: Address? = null;
}

contract DefaultsForOptionals {
    o: OptionalStructWithDefaults;

    init() {
        self.o = OptionalStructWithDefaults{};
    }
}