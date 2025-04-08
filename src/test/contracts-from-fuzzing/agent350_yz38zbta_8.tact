struct ZeroDefaults {
    x: Int = 0;
    y: Bool = false;
    s: String = "";
}

contract DefaultStructFieldTest {
    f: ZeroDefaults;

    init() {
        self.f = ZeroDefaults{};
    }
}
