struct NestedOptionalDefaults {
    x: Int? = null;
    y: String? = null;
    z: Bool? = null;
}

contract OptionalDefaultsTest {
    data: NestedOptionalDefaults;

    init() {
        self.data = NestedOptionalDefaults{};
    }
}
