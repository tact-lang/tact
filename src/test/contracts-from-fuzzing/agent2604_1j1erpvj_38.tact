struct NestedOptionalDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
}

contract NestedDefaultTest {
    val: NestedOptionalDefaults;

    init() {
        self.val = NestedOptionalDefaults{};
    }
}