struct MixedDefault {
    a: Int = 1;
    b: Int?;
    c: Int? = null;
}

contract TestMixedDefaults {
    data: MixedDefault;
    init() {
        self.data = MixedDefault{};
    }
}