contract BoolDefaults {
    x: Bool = true;
    y: Bool = false;
    z: Bool = true;

    init() {
        self.x = false;
        self.y = true;
        self.z = false;
    }
}