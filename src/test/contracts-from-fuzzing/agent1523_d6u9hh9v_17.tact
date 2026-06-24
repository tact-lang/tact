contract InitDefaults {
    x: Int = 7;
    y: Bool?;
    z: Int?;

    init() {
        self.y = null;
        self.z = 42;
    }
}