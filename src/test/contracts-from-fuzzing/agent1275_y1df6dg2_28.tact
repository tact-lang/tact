struct NestedOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract NestedOptDefaultsTest {
    val: NestedOptionalDefaults;

    init() {
        self.val = NestedOptionalDefaults{};
    }
}