struct BothDefOpt {
    x: Int? = null;
    y: String? = null;
}

contract WithOptDefaults {
    f: BothDefOpt;
    init() {
        self.f = BothDefOpt{};
    }
}