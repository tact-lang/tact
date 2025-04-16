struct OptionDefault {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDefTest {
    data: OptionDefault;

    init() {
        self.data = OptionDefault{};
    }
}
