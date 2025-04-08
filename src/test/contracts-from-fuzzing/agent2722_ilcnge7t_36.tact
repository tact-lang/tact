contract OptDefaults {
    x: Int? = null;
    y: Bool? = true;
    z: String? = null;

    init() {
        self.x = 123;
        self.y = false;
        self.z = "xxx";
    }
}