struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: String = "foo";
    e: Bool? = null;
    f: Int? = null;
    g: String? = null;
}

contract DefaultsStructFields {
    val: ManyDefaults;
    init() {
        self.val = ManyDefaults{};
    }
}