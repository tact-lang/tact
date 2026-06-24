struct OptionInDefault {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDefaultTest {
    s: OptionInDefault;

    init() {
        self.s = OptionInDefault{};
    }
}