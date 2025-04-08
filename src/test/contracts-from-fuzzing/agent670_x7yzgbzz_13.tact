struct MixedDefaults {
    a: Int = 5;
    b: Bool;
    c: Int?;
    d: Bool? = true;
}

contract TestMixedDefaults {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            b: false,
            c: null,
        };
    }
}