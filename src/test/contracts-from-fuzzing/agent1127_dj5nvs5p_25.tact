struct ZeroDefaults {
    i: Int = 0;
    b: Bool = false;
    s: String = "";
}

contract ZeroDefaultsTest {
    d: ZeroDefaults;

    init() {
        self.d = ZeroDefaults{};
    }
}
