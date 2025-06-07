struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: String = "d";
    e: String = "e";
    f: Bool = false;
    g: Int = 7;
    h: Int = 8;
}

contract TestManyDefaults {
    field: ManyDefaults;

    init() {
        self.field = ManyDefaults{};
    }
}