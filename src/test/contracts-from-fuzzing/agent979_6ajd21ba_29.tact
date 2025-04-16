struct MixedDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "";
    d: Int? = null;
    e: Bool? = null;
}

contract TestMixDef {
    f: MixedDefaults;

    init() {
        self.f = MixedDefaults{};
    }
}