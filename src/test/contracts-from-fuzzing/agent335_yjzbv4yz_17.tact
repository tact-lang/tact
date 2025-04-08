struct MixedDefaults {
    i: Int = 5;
    b: Bool;
    c: Int?;
}

contract DefaultsMix {
    f: MixedDefaults;

    init() {
        self.f = MixedDefaults{
            b: true,
            c: null,
        };
    }
}
