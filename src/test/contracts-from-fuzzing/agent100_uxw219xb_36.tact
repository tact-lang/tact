struct ZeroDefaults {
    x: Int = 0;
    y: Bool = false;
    s: String = "";
}

contract ZeroDefaultsContract {
    data: ZeroDefaults;

    init() {
        self.data = ZeroDefaults{};
    }
}