struct SOptDefault {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract OptDefaultsTest {
    d: SOptDefault;

    init() {
        self.d = SOptDefault{};
    }
}
