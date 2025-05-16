struct OptDefault {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDefaultsTest {
    st: OptDefault;

    init() {
        self.st = OptDefault{};
    }
}
