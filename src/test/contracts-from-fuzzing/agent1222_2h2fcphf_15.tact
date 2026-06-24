struct LongDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "one";
    d: Int = 2;
    e: Bool = true;
    f: String = "two";
}

contract TestLongDefaults {
    s: LongDefaults;

    init() {
        self.s = LongDefaults{};
    }
}