struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int = 42;
    e: Bool = false;
    f: String = "zzz";
}

contract TestContract {
    s: ManyDefaults;

    init() {
        self.s = ManyDefaults{};
    }
}