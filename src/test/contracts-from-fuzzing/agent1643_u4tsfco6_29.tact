struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract DefaultsNested {
    par: ManyDefaults;

    init() {
        self.par = ManyDefaults{};
    }
}