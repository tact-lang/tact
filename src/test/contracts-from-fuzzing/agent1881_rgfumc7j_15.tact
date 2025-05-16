struct ZeroDefaults {
    i: Int = 0;
    s: String = "";
    b: Bool = false;
}

contract ZeroTest {
    f: ZeroDefaults;

    init() {
        self.f = ZeroDefaults{};
    }
}