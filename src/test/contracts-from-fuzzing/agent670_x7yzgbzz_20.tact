struct LongDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int? = null;
    d: Bool? = true;
    e: Int = 5;
    f: Bool = true;
    g: Int? = null;
    h: Bool? = false;
}

contract DefMany {
    fs: LongDefaults;

    init() {
        self.fs = LongDefaults{};
    }
}