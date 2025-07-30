struct ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract DefaultsAllZero {
    store: ZeroDefaults;

    init() {
        self.store = ZeroDefaults{};
    }
}