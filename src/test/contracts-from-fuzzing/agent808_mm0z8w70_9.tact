contract OptionalFields {
    x: Int?;
    y: Bool?;
    z: String?;
    s: Slice?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.s = null;
    }
}