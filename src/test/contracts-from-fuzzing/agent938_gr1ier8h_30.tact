struct ChainDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}

contract ChainDefaultInit {
    s1: ChainDefaults;
    s2: ChainDefaults;

    init() {
        self.s1 = ChainDefaults{};
        self.s2 = ChainDefaults{};
    }
}
