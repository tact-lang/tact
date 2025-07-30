contract OptWithNonNullDefaults {
    x: Int? = 42;
    y: String? = "non";
    z: Bool? = true;

    init() {
        // override to null to change flag explicitly
        self.x = null;
        self.y = null;
        self.z = null;
    }
}