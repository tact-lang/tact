contract MixOptionalsAndDefaults {
    x: Int?;
    y: Int = 5;
    z: Bool?;
    w: Bool = false;

    init() {
        self.x = null;
        self.z = null;
    }
}
