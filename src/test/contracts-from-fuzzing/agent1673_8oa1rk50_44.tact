struct NestedOptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract NestedOptDefaultsTest {
    val: NestedOptDefaults;

    init() {
        self.val = NestedOptDefaults{};
    }
}