struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract BigDefaults {
    data: ManyDefaults;

    init() {
        self.data = ManyDefaults{};
    }
}
