contract OptFields {
    x: Int?;
    y: String?;
    z: Bool?;

    init() {
        self.x = null;
        self.y = "abc";
        self.z = null;
    }
}
