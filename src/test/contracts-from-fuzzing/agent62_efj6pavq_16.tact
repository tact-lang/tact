contract OptionalAndDefaults {
    x: Int = 5;
    y: Int?;
    z: String? = null;

    init() {
        self.x = 42;
        self.y = null;
        self.z = null;
    }
}