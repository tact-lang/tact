struct OptionalsDefaults {
    foo: Int? = null;
    bar: Bool? = true;
}

contract OptsDefaultsTest {
    val: OptionalsDefaults;

    init() {
        self.val = OptionalsDefaults{};
    }
}