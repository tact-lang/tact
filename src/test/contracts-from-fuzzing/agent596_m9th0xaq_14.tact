struct ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract ZeroDefTest {
    z: ZeroDefaults;

    init() {
        self.z = ZeroDefaults{};
    }
}