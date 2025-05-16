struct ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int = 2;
    e: Bool = true;
    f: String = "bye";
}

contract StructConstructDefaults {
    s: ManyDefaults;

    init() {
        self.s = ManyDefaults{};
    }
}