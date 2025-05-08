struct ZeroDefaults {
    a: Int = 0;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "";
    f: String?;
}

contract DefaultsTest {
    s: ZeroDefaults;
    init() {
        self.s = ZeroDefaults{};
    }
}