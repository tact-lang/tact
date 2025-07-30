struct ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
}

contract ZeroDefaultsContract {
    z: ZeroDefaults;

    init() {
        self.z = ZeroDefaults{};
    }
}