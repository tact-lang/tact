struct ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Int = 2;
    e: Bool = true;
    f: String = "def";
}

contract AllDefaults {
    s: ManyDefaults;

    init() {
        self.s = ManyDefaults{};
    }
}
