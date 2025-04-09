struct OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract StructOptDefaultsTest {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{};
    }
}