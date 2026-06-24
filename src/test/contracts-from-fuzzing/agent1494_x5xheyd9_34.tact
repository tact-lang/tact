struct NullDefaults {
    a: Int? = null;
    b: Address? = null;
    c: String? = null;
    d: Cell? = null;
    e: Slice? = null;
}

contract OptionalDefaultsTest {
    data: NullDefaults;

    init() {
        self.data = NullDefaults{};
    }
}
