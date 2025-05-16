struct OptionalsAndDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Int = 0;
    f: Bool = false;
    g: String = "";
}

contract OptsDefsNested {
    f: OptionalsAndDefaults;

    init() {
        self.f = OptionalsAndDefaults{};
    }
}
