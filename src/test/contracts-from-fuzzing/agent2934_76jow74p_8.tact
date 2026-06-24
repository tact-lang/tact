struct LongDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Bool = false;
    e: Bool = true;
    f: String = "foo";
    g: String = "bar";
}

contract StructManyDefaults {
    s: LongDefaults;

    init() {
        self.s = LongDefaults{};
    }
}