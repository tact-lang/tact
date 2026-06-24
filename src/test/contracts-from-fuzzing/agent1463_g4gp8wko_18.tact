struct ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    s: String = "";
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;
}

contract ZeroDefaultsTest {
    d: ZeroDefaults;

    init() {
        self.d = ZeroDefaults{};
    }
}
