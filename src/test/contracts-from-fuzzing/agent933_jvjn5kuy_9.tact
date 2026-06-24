struct Defaults {
    a: Int = 100;
    b: Bool = true;
    c: String = "hello";
}

contract WithDefaults {
    s: Defaults;

    init() {
        self.s = Defaults{};
    }
}
