contract BoolDefaults {
    x: Bool;
    y: Bool = true;

    init() {
        self.x = false;
    }
}