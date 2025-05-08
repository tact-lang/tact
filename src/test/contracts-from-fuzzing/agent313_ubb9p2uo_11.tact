struct LargeDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int = 2;
    e: Bool = true;
    f: String? = null;
    g: Int = 3;
    h: Bool = false;
    i: String? = "hello";
}

contract StructDefaults {
    ff: LargeDefaults;

    init() {
        self.ff = LargeDefaults{};
    }
}