contract OptionalFields {
    x: Int?;
    y: Bool?;
    z: String?;

    init() {
        self.x = null;
        self.y = true;
        self.z = null;
    }
}