struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Bool = true;
    f: String = "x";
    g: String = "y";
    h: String = "z";
}

contract DefaultsEverywhere {
    field: ManyDefaults;
    init() {
        self.field = ManyDefaults{};
    }
}