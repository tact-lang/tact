contract InitDefaults {
    x: Int;
    y: Int = 42;

    init() {
        self.x = 10;
    }
}