contract EmptyDefaults {
    x: Int; // no default
    y: Bool; // no default

    init() {
        self.x = 123;
        self.y = true;
    }
}