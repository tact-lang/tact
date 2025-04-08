struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Bool = false;
    f: Bool = true;
}

contract StructFullDefaults {
    s: ManyDefaults;
    init() {
        self.s = ManyDefaults{};
    }
}