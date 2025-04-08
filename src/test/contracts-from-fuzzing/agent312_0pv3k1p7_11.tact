contract ChainedDefaults {
    x: Int = 1;
    y: Int = 2;
    z: Int; // no default

    init() {
        self.z = 3;
    }
}