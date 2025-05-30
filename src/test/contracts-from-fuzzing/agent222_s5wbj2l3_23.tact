struct OptionWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
}

contract OptDefaultTest {
    val: OptionWithDefaults;

    init() {
        self.val = OptionWithDefaults{};
    }
}