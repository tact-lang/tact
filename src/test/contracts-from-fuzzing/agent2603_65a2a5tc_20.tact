contract AltOptDefaults {
    x: Int?;
    y: Bool = false;
    z: Int = 0;

    init() {
        self.x = null;
        self.y = true;
        self.z = 42;
    }
}
