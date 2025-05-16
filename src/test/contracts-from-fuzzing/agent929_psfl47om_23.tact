struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: String = "abc";
    d: Bool = false;
}

contract DefaultsStruct {
    v: ManyDefaults;

    init() {
        self.v = ManyDefaults{};
    }
}