struct ManyIntOptionalDefaults {
    a: Int? = null;
    b: Int? = null;
    c: Int? = null;
    d: Int? = null;
    e: Int? = null;
    f: Int? = null;
    g: Int? = null;
    h: Int? = null;
    i: Int? = null;
    j: Int? = null;
}

contract OptDefaults2 {
    vals: ManyIntOptionalDefaults;

    init() {
        self.vals = ManyIntOptionalDefaults{};
    }
}