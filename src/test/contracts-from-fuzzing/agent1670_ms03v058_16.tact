struct LongDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "a";
    d: Int = 2;
    e: Bool = true;
    f: String = "b";
    g: Int = 3;
}

contract TestLongDefaults {
    store: LongDefaults;
    init() {
        self.store = LongDefaults{};
    }
}
