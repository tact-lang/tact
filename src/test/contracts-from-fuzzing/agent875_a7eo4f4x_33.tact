struct ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract ZeroDefaultsContract {
    data: ZeroDefaults;
    init() {
        self.data = ZeroDefaults{};
    }
}