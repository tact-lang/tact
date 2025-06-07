struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: String = "d";
    e: Bool? = null;
}

contract StructWithManyDefaults {
    s: ManyDefaults;

    init() {
        self.s = ManyDefaults {
            a: 10, b: 20, c: false, d: "x", e: true
        };
    }
}
