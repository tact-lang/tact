contract InitDefaultsOverride {
    val: Int = 5;
    valOpt: Int?;

    init() {
        self.val = 100;
        self.valOpt = null;
    }
}
