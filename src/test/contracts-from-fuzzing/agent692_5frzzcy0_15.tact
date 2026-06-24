struct S {
    a: Int? = null;
    b: Int? = null;
    c: Int? = null;
    d: Int? = null;
    e: Int? = null;
    f: Int? = null;
    g: Int? = null;
    h: Int? = null;
}

contract OptDefaults {
    s: S;

    init() {
        self.s = S{};
    }
}