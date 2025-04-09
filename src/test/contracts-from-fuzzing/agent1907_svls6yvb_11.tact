struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = false;
    d: String = "d";
    e: String = "e";
    f: Bool = true;
    g: Int = 7;
}

contract StructManyDefaults {
    conf: ManyDefaults;

    init() {
        self.conf = ManyDefaults{};
    }
}