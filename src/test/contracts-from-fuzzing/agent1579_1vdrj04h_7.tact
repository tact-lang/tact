struct MixedDefaults {
    a: Int = 10;
    b: Bool;
    c: Int?;
    d: Bool? = false;
}

contract TestDefaults {
    f: MixedDefaults;
    init() {
        self.f = MixedDefaults{ b: true, c: null };
    }
}