struct ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Bool?;
}

contract HasDefaults {
    f: ManyDefaults;

    init() {
        self.f = ManyDefaults{
            d: null
        };
    }
}