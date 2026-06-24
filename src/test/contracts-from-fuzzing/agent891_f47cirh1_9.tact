contract OptionalDefaults {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
    w: Address? = null;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.w = null;
    }
}
