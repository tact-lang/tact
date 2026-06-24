struct OptionalDefault {
    num: Int? = null;
    txt: String? = null;
}

contract OptionalDefaultsTest {
    opt: OptionalDefault;

    init() {
        self.opt = OptionalDefault{};
    }
}
