struct OptsWithDefaults {
    a: Int? = null;
    b: String? = null;
    c: Address? = null;
}

contract OptDefaultsTest {
    s: OptsWithDefaults;

    init() {
        self.s = OptsWithDefaults{};
    }
}