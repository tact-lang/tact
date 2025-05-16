struct JustDefaults {
    a: Int = 11;
    b: Bool = true;
    c: String = "def";
}

contract JustDefStruct {
    s: JustDefaults;

    init() {
        self.s = JustDefaults{};
    }
}