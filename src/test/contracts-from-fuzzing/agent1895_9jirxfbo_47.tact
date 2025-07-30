contract OverrideDefaults {
    a: Int = 1;
    b: Int;

    init() {
        self.a = 100;
        self.b = 200;
    }
}