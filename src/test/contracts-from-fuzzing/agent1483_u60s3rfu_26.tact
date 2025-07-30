struct ZeroDefaults {
    one: Int = 0;
    two: Int = 0;
    three: Int = 0;
}

contract ZeroDefaultsContract {
    zs: ZeroDefaults;

    init() {
        self.zs = ZeroDefaults{};
    }
}