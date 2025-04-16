struct Defaults {
    i: Int = 0;
    b: Bool = false;
}

contract WithDefault {
    v: Defaults;

    init() {
        self.v = Defaults{};
    }
}
