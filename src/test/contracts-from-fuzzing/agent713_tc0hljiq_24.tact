struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
}

contract DefaultsMany {
    m: ManyDefaults;
    init() {
        self.m = ManyDefaults{};
    }
}