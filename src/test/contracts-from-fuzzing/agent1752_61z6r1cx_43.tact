contract ShadowingWithDefaults {
    x: Int = 5;

    init() {
        self.x = 42;
    }
}