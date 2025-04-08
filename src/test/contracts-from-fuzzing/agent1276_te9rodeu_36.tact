struct DefOnly {
    a: Int = 1;
    b: String = "hi";
}

contract OnlyDefaults {
    f: DefOnly;
    init() {
        self.f = DefOnly{};
    }
}