contract OptionalDefaults {
    x: Int? = null;
    y: Bool? = null;
    z: Int = 0;

    init() {
        self.x = 42;
        self.y = true;
        self.z = 7;
    }
}