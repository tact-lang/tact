struct MixDefaultsOpts {
    i: Int = 100;
    b: Bool? = null;
    s: String = "hello";
}

contract NestedDefaultsOpts {
    a: MixDefaultsOpts;
    b: MixDefaultsOpts;

    init() {
        self.a = MixDefaultsOpts{};
        self.b = MixDefaultsOpts{};
    }
}