struct Def {
    i: Int = 5;
}

contract InitDefault {
    f: Def;
    init() {
        self.f = Def{};
    }
}