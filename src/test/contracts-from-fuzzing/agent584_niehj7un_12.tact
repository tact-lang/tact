contract OptionalDefaults {
    x: Int?;
    y: Bool? = null;
    z: String? = "hello";

    init() {
        self.x = null;
        self.y = true;
        self.z = "hi";
    }
}