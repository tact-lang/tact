struct ZeroDefaults {
    a: Int = 0;
    b: Int = 0;
    c: Int = 0;
    d: Int = 0;
}

contract TestContract {
    z: ZeroDefaults;
    init() {
        self.z = ZeroDefaults{};
    }
}