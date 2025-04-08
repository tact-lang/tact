struct HasDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: String? = null;
}

contract Test {
    hd: HasDefaults;
    init() {
        self.hd = HasDefaults{};
    }
    receive() { let _ = self.hd.a; }
}