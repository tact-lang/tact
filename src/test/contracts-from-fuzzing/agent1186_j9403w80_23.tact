struct ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract ZeroDefaultInit {
    d: ZeroDefaults;

    init() {
        self.d = ZeroDefaults{};
    }
}
