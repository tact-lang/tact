struct ZeroDefaults {
    i: Int = 0;
    b: Bool = false;
    s: String = "";
}

contract ZeroDefaultsTest {
    data: ZeroDefaults;
    init() {
        self.data = ZeroDefaults{};
    }
}