struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Int = 2;
    e: Bool = false;
    f: String = "y";
    g: Int = 3;
    h: Bool = true;
    i: String = "z";
}

contract DefaultsStress {
    data: ManyDefaults;

    init() {
        self.data = ManyDefaults{};
    }
}
