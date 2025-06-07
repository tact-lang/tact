struct Defaults {
    a: Int = 5;
    b: Bool = false;
}

contract WithDefaults {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}