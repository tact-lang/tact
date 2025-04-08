struct LongDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;
    f: Address? = null;
    g: Int = 42;
    h: Bool = true;
    i: String = "";
    j: Int? = null;
}

contract Test {
    store: LongDefaults;

    init() {
        self.store = LongDefaults{};
    }
}