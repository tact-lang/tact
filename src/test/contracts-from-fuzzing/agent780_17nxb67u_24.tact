struct ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract ZeroDefaultsStruct {
    s: ZeroDefaults;

    init() {
        self.s = ZeroDefaults{};
    }
}