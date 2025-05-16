struct ManyDefaults {
    a: Int = 111;
    b: Bool = true;
    c: String = "cc";
    d: Bool? = null;
    e: Int? = null;
}

contract DefaultsNest {
    m: ManyDefaults = ManyDefaults{};

    init() {
        self.m = ManyDefaults{ a: 999, b: false, c: "ss", d: true, e: 42 };
    }
}